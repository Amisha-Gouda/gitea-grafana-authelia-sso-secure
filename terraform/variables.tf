variable "region" {
  default = "us-east-1"
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "public_key_path" {
  description = "Path to your public key"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "ami_id" {
  description = "Ami id"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key for SSH"
  type        = string
}
