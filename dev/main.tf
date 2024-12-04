module "vpc" {
  source = "git@github-win:OnlyLight/dev-terraform-module.git//vpc?ref=v0.0.1"

  env = terraform.workspace
}

module "eks" {
  source = "git@github-win:OnlyLight/dev-terraform-module.git//eks?ref=v0.0.1"

  env = terraform.workspace
  private_zone1_id = module.vpc.private_zone1_id
  private_zone2_id = module.vpc.private_zone2_id
}
