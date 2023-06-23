variable "region" {
  description = "AWS region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "key_pair_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "instance_name" {
  description = "Instance name"
  type        = string
}
