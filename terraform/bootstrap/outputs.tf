output "github_actions_role_arn" {
  description = "Paste to GitHub Variables as AWS_ROLE_ARN"
  value       = aws_iam_role.github_actions.arn
}
