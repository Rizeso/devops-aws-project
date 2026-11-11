variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "github_repository" {
  description = "Repo uprawnione do przyjęcia roli CI, w formacie owner/name"
  type        = string
  default     = "Rizeso/devops-aws-project"
}

variable "state_bucket" {
  description = "Bucket S3 z plikami stanu Terraform"
  type        = string
  default     = "rizes-tf-lock4"
}
