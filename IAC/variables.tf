variable "ec2_instance_size" {
  type        = string
  description = "EC2 instance size"
}

variable "os_platform" {
  type        = string
  description = "The instance OS platform"
}

variable "environment" {
  type        = string
  description = "The environment to deploy ec2"
}

variable "subnet_type" {
  type        = string
  description = "The type of subnet to deploy instance"
}

variable "cost_center" {
  type        = string
  description = "Cost Center to associate instance"
}

variable "instance_name" {
  type        = string
  description = "The name of the instance"
  validation {
    condition = can(regex("^[a-zA-Z]+$", var.instance_name)) && length(var.instance_name) == 4
    error_message = "Instance name must be 6 characters in length containing only [a-zA-Z]"
  }
}

variable "instance_profile" {
  type        = string
  description = "The name of the instance profile"
  default     = "HF-EC2-SSMRole"
}

variable "user_data_path" {
  type        = string
  description = "Path to the User data .sh to apply on instance"
  default     = "./install-scripts/install.sh"
}

variable "cluster_name" {
  type        = string
  description = "RDS Cluster Name"
  default     = "appNameDB-cluster"
}

variable "database_name" {
  type        = string
  description = "RDS DB Name"
  default     = "appNameDB"
}

variable "engine" {
  type        = string
  description = "RDS DB Engine"
  default     = "mysql"
}

variable "rds_instance_size" {
  type        = string
  description = "RDS Instance Size"
  default     = "large"
}

variable "ami_filters" {
  type        = map
  description = "Global ami filters"
}

variable "account_vars" {
  type        = map
  description = "Global account variables"
}

variable "cost_centers" {
  type        = map
  description = "Global cost centers"
}
