variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "ssh_public_key" {
  type = string
}

variable "domain_name" {
  type = string
}

###############
# Nazwy tagow #
###############
variable "project" {
  description = "Name of the project"
  type        = string
  default     = "devops"
}

variable "environment" {
  description = "Name of the environment"
  type        = string
  default     = "lab"
}

variable "managed_by" {
  description = "Who manages the infra"
  type        = string
  default     = "KGruszczynski"
}