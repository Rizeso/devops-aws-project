variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_public_cidr_a" {
  description = "Public subnet AZ-A"
  type        = string
  default     = "10.0.10.0/24"
}

variable "vpc_public_cidr_b" {
  description = "Public subnet AZ-B"
  type        = string
  default     = "10.0.11.0/24"
}

variable "vpc_private_cidr_a" {
  description = "Private subnet AZ-A"
  type        = string
  default     = "10.0.20.0/24"
}

variable "vpc_private_cidr_b" {
  description = "Private Subnet AZ-B"
  type        = string
  default     = "10.0.21.0/24"
}

variable "vpc_az" {
  description = "Availability Zone, default eu-central-1"
  type        = string
  default     = "eu-central-1"
}