# AWS EKS Node Group Terraform module

Terraform module which creates EKS Node Group resources on AWS.

These types of resources are supported:

* [EKS Node Group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group)
* [IAM Role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)
* [IAM Role Policy Attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment)
* [IAM Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)


## Usage
### EKS Node Group

main.tf
```hcl
module "eks_worker_nodes" {
  source = "git@gitlab.com:jangjaelee/terraform-aws-eks-workernodes.git"

  vpc_name        = local.vpc_name
  cluster_name    = local.cluster_name
  key_name        = local.vpc_name  
  node_group_name = "${local.cluster_name}_Worker_Nodes_Group_1"
  
  ami_type        = "AL2_x86_64"  # AL2_x86_64_GPU, AL2_ARM_64, CUSTOM
  capacity_type   = "ON_DEMAND"
  disk_size       = 20
  instance_types  = ["t3.2xlarge"]
  
  scaling_desired_size = 4
  scaling_min_size     = 4
  scaling_max_size     = 8

  timeout_create = "60m"
  timeout_update = "60m"
  timeout_delete = "30m"

  env = "dev"
}
```

locals.tf
```hcl
locals {
  vpc_name = "KubeSphere-dev"
  cluster_name = "KubeSphere-v121-dev"
  cluster_version = "1.21"
}
```

providers.tf
```hcl
provider "aws" {
  version = ">= 3.2.0"
  region = var.region
  allowed_account_ids = var.account_id
  profile = "eks_service"
}
```

terraform.tf
```hcl
terraform {
  required_version = ">= 0.13.0"

  backend "s3" {
    bucket = "kubesphere-terraform-state-backend"
    key = "kubesphere/eks-cluster-workernodes/terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "kubesphere-terraform-state-locks"
    encrypt = true
    profile = "eks_service"
  }
}
```

variables.tf
```hcl
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-2"
}

variable "account_id" {
  description = "List of Allowed AWS account IDs"
  type        = list(string)
  default     = ["123456789012"]
}
```
