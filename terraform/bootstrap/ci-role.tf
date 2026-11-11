#########################################
#		trust policy		#
#########################################
data "aws_iam_policy_document" "github_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }

    # Token musi być wystawiony DLA AWS STS, nie dla innej usługi.
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    # Tylko to repo i tylko te dwa konteksty uruchomienia.
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values = [
        "repo:${var.github_repository}:pull_request",
        "repo:${var.github_repository}:ref:refs/heads/main",
      ]
    }
  }
}

resource "aws_iam_role" "github_actions" {
  name               = "github-actions-terraform"
  description        = "Przyjmowana przez GitHub Actions przez OIDC"
  assume_role_policy = data.aws_iam_policy_document.github_assume_role.json
}

#########################################
#		permissions		#
#########################################

# plan odświeża stan wobec rzeczywistości, więc musi czytać zasoby.
resource "aws_iam_role_policy_attachment" "read_only" {
  role       = aws_iam_role.github_actions.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

# plan z use_lockfile ZAPISUJE plik blokady, więc sam odczyt nie wystarczy.
data "aws_iam_policy_document" "tf_state" {
  statement {
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::${var.state_bucket}"]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
    ]
    resources = ["arn:aws:s3:::${var.state_bucket}/devops/lab/*"]
  }
}

resource "aws_iam_role_policy" "tf_state" {
  name   = "terraform-state-access"
  role   = aws_iam_role.github_actions.id
  policy = data.aws_iam_policy_document.tf_state.json
}
