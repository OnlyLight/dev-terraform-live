# Dev Terraform Live
This repository manages AWS infrastructure (VPC and EKS) for multiple environments (dev, staging, prod) using Terraform and Terragrunt.

## Structure

`live/`: Environment-specific configurations (us-east-1/dev, us-east-1/staging, us-east-1/prod).
`live/us-east-1/<env>/vpc/`: VPC module configuration.
`live/us-east-1/<env>/eks/`: EKS module configuration, depends on VPC.

## Prerequisites
Terraform >= 1.5.0
Terragrunt >= 0.38.0
AWS CLI configured with access keys
S3 bucket (my-terraform-state-bucket) and DynamoDB table (terraform-locks) for state management

## Setup

1. Clone the repository:
```
git clone https://github.com/OnlyLight/dev-terraform-live.git
cd dev-terraform-live
```

2. Initialize Terragrunt:
```
cd live/us-east-1/dev/vpc
terragrunt init
cd ../eks
terragrunt init
```


3. Plan and apply changes:
```
cd ../vpc
terragrunt plan -out=tfplan
terragrunt apply tfplan
cd ../eks
terragrunt plan -out=tfplan
terragrunt apply tfplan
```


4. Use terragrunt run-all for multi-module operations:
```
cd live/us-east-1/dev
terragrunt run-all plan -out=tfplan
terragrunt run-all apply tfplan
```

5. Repeat for staging and prod.

## Notes

- Modules are sourced from git@github-win:OnlyLight/dev-terraform-module.git.
- EKS depends on VPC outputs (private_zone1_id, private_zone2_id).
- Destroy resources with terragrunt run-all destroy to avoid costs.
