locals {
  common_tags = {
    "cloud/platform" = "AWS"
    "cloud/platform_env" = var.env
    "cloud/managed_by" = "terraform"
    "cloud/module" = "eks-cluster-workernodes"
  }
}
