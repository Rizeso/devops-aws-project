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
  default = "vpc-0d9baa2393fe4831d"
}
variable "subnet_id" {
  type    = string
  default = "subnet-067e31e98454eebf3"
}