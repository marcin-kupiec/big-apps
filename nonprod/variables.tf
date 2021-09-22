variable "vpc_id" {
  type        = string
  description = "VPC identifier"
}

//variable "public_subnets" {
//  type        = list(string)
//  description = "List of public subnets"
//  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
//}
//
//variable "private_subnets" {
//  type        = list(string)
//  description = "List of private subnets"
//  default     = ["10.0.100.0/24", "10.0.101.0/24", "10.0.102.0/24"]
//}
