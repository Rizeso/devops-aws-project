terraform {
  backend "s3" {
    bucket = "rizes-tf-lock"
    key = "devops/lab/infra/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-locks-db"
    encrypt = true
  }

}
