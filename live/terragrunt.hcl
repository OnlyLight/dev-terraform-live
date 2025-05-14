# # Defining shared configurations for all environments
# remote_state {
#   backend = "s3"
#   config = {
#     bucket         = "my-terraform-state-bucket"
#     key            = "${path_relative_to_include()}/terraform.tfstate"
#     region         = "ap-southeast-1"
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
# }

# Pin Terraform version
# terraform_version_constraint = ">= 1.5.0"
terragrunt_version_constraint = ">= 0.38.0"

locals {
  # Get the relative path (e.g., us-east-1/dev/vpc) and split by '/'
  path_parts = split("/", path_relative_to_include())
  # Environment is the second element (index 1) in the path (e.g., dev, staging, prod)
  env = element(local.path_parts, 1)
}

# Set default inputs for all modules
inputs = {
  env = local.env
}