terraform {
  backend "s3" {
    bucket = "pintuwap"
    key    = "resource/terraform.tfstate"
    region = "us-east-1"
  }
}