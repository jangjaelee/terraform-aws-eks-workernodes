variable "vpc_name" {
  description = "Name to be used on all the resources as identifier for VPC"
  type        = string
}

variable "cluster_name" {
  description = "Name for EKS Cluster"
  type        = string
}

variable "node_group_name" {
  description = "Name of the EKS Node Group"
  type        = string
}

variable "ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group"
  type        = string
  default     = "AL2_x86_64"
}

variable "capacity_type" {
  description = "Type of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT"
  type        = string
  default     = "ON_DEMAND"
}

variable "disk_size" {
  description = "Disk size in GiB for worker nodes"
  type        = number
  default     = 20
}

variable "instance_types" {
  description = "Set of instance types associated with the EKS Node Group"
  type        = list(string)
}

variable "scaling_desired_size" {
  description = "Desired size of worker nodes for auto scaling"
  type        = number
  default     = 1
}

variable "scaling_min_size" {
  description = "Min size of worker nodes for auto scaling"
  type        = number
  default     = 1
}

variable "scaling_max_size" {
  description = "Max size of worker nodes for auto scaling"
  type        = number
  default     = 3
}

variable "key_name" {
  description = "EC2 Key Pair name that provides access for SSH communication with the worker nodes in the EKS Node Group."
  type        = string
}

variable "timeout_create" {
  description = "How long to wait for the EKS Node Group to be create. Default 60 minutes."
  type        = string
  default     = "60m"
}

variable "timeout_update" {
  description = "How long to wait for the EKS Node Group to be updated. Default 60 minutes."
  type        = string
  default     = "60m"
}

variable "timeout_delete" {
  description = "How long to wait for the EKS Node Group to be deleted. Default 60 minutes."
  type        = string
  default     = "30m"
}

variable "env" {
  description = "Environment"
  type        = string
}
