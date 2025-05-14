# Including root configuration
# Automatically find the root terragrunt.hcl and inherit configuration
include {
  path = find_in_parent_folders()
}

# Defining module source and inputs
terraform {
  source = "git@github-win:OnlyLight/dev-terraform-module.git//vpc?ref=v0.0.1"
}

inputs = {
  vpc_cidr                      = "10.0.0.0/16"
  vpc_cidr_subnet_private_zone1 = "10.0.0.0/19"
  vpc_cidr_subnet_private_zone2 = "10.0.32.0/19"
  vpc_cidr_subnet_public_zone1  = "10.0.64.0/19"
  vpc_cidr_subnet_public_zone2  = "10.0.96.0/19"
}