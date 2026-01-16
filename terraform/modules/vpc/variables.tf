variable "vpc_cidr" {
  description = "CIDR block for the VPC, default 10.0.0.0/16"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_public_cidr" {
  description = "Public VPC, default 10.0.10.0/24"
  type        = string
  default     = "10.0.10.0/24"
}

variable "vpc_private_cidr" {
  description = "Private VPC, default 10.0.20.0/24"
  type        = string
  default     = "10.0.20.0/24"
}

variable "vpc_az" {
  description = "Availability Zone, default eu-central-1"
  type        = string
  default     = "eu-central-1"
}