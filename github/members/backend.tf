# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket = "lodestar-terraform-state"
    key    = "github/members/terraform.tfstate"
    region = "us-east-2"
  }
}
