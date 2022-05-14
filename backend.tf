terraform {
  backend "s3" {
      bucket         = "tmstate1"
      key            = "terraform.tfstate"
      region         = "us-west-2"
  }
}
