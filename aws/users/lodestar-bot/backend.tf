# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket = "lodestar-terraform-state"
    key    = "aws/users/lodestar-bot/terraform.tfstate"
    region = "us-east-2"
  }
}
