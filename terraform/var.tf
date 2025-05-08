
variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "profile" {
  description = "AWS profile"
  type        = string
  default     = "default"
}

variable "docker_image" {
  description = "Docker image for the application"
  type        = string
  default     = "654463037626.dkr.ecr.eu-west-2.amazonaws.com/aleksandra/my-backend-app:latest"
}

variable "container_name" {
  description = "Container name tag"
  type        = string
  default     = "aleksandra-site"

}

variable "vpc_name" {
  description = "VPC name tag"
  type        = string
  default     = "aleksandra-vpc"
}

variable "internet_gateway_name" {
  description = "Internet Gateway name tag"
  type        = string
  default     = "aleksandra-gateway"
}

variable "public_subnet_name" {
  description = "Public Subnet name tag"
  type        = string
  default     = "aleksandra-public-subnet"
}
variable "private_subnet_name" {
  description = "Private Subnet name tag"
  type        = string
  default     = "aleksandra-private-subnet"
}
variable "public_rt_name" {
  description = "Public Route Table name tag"
  type        = string
  default     = "aleksandra-public-rt"

}

variable "private_rt_name" {
  description = "Private Route Table name tag"
  type        = string
  default     = "aleksandra-private-rt"
}
variable "public_security_group_name" {
  description = "Public Security Group name tag"
  type        = string
  default     = "aleksandra-public-sg"

}

variable "private_security_group_name" {
  description = "Private Security Group name tag"
  type        = string
  default     = "aleksandra-private-sg"

}

variable "ecs_cluster_name" {
  description = "ECS Cluster name tag"
  type        = string
  default     = "aleksandra-ecs-cluster"

}

variable "alb_target_group_name" {
  description = "ALB Target Group name tag"
  type        = string
  default     = "aleksandra-alb-tg"

}

variable "ecs_task_execution_role_name" {
  description = "ECS Task Execution Role name tag"
  type        = string
  default     = "aleksandra-ecs-task-execution-role"

}

variable "alb_name" {
  description = "ALB name tag"
  type        = string
  default     = "aleksandra-alb"

}



variable "app_service_name" {
  description = "ECS Service name tag"
  type        = string
  default     = "aleksandra-app-service"

}

variable "nat_gateway_name" {
  description = "NAT gateway name tag"
  type        = string
  default     = "aleksandra-nat-gateway"

}

variable "frontend_bucket_name" {
  description = "S3 bucket name tag"
  type        = string
  default     = "aleksandra-frontend-bucket"

}
