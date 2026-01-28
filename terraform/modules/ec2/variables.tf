variable "ami" {
  type    = string
  default = "ami-0a116fa7c861dd5f9" # Ubuntu 22.04
}
variable "instance_type" {
  type    = string
  default = "t3.micro"
}
variable "vpc_id" {
  type    = string
}
variable "subnet_id" {
  type    = string
}