data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "aws-terraform-backend-state-nila"
    key = "vpc/terraform.tfstate"
  }
}
