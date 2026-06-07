variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "environment" {
  type = string
}
variable "public_subnet_cidr" {
  type = string
}

variable "private_subnet_cidr" {
  type = string
}

variable "availability_zone" {
  type = string
}
variable "instance_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "key_name" {
  type = string
}