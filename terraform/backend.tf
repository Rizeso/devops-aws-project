terraform {
  backend "s3" {
    bucket       = "rizes-tf-lock2"
    key          = "devops/lab/infra/terraform.tfstate"
    region       = "eu-central-1"
    use_lockfile = true
    encrypt      = true
  }

}
