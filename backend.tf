terraform {
  backend "s3" {
    bucket = "terra-aws-project"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}
