terraform {
  backend "s3" {
    bucket         = "terraform-files-dev09" # must already exist
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
