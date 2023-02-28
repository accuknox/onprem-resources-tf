/*
  Global variables
*/
variable "region" {
  #default = "us-east-2"
}

variable "elasticache_subnet_group_name" {
  default = "cspm-elasticache"
  type    = string
}

variable "cidr" {
  default = "10.4.0.0/16"
}

variable "private_subnets" {
  default = ["10.4.1.0/24", "10.4.2.0/24", "10.4.3.0/24"]
}

variable "public_subnets" {
  default = ["10.4.4.0/24", "10.4.5.0/24", "10.4.6.0/24"]
}

variable "elasticache_subnets" {
  default = ["10.4.7.0/24", "10.4.8.0/24", "10.4.9.0/24"]
}

variable "database_subnets" {
  default = ["10.4.10.0/24", "10.4.11.0/24", "10.4.12.0/24"]
}

/*
  SES config
*/

variable "domain" {
  type    = string
  #default = "example.com"
}

variable "name" {
  type        = string
  description = "Name of the IAM user"
  #default     = "smpt"
}

variable "user_policy_name_prefix" {
  type        = string
  description = "Name prefix of the IAM policy that is assigned to the user"
  default     = "SESSendOnlyAccess"
}

variable "path" {
  type        = string
  description = "Path in which to create the user"
  default     = null
}

variable "permissions_boundary" {
  type        = string
  description = "The ARN of the policy that is used to set the permissions boundary for the user"
  default     = null
}

/*
  VPC variables
*/
variable "vpc_name" {
  default = "accuknox-onprem"
}

/*
  EKS cluster variables
*/
variable "cluster_name" {
  default = "accuknox-onprem"
}

variable "worker_instance_type_soarcast" {
  default = "t3a.medium"
}

variable "worker_instance_type_saltstack" {
  default = "t3a.medium"
}

variable "worker_instance_type_divy" {
  default = "t3a.large"
}

variable "worker_instance_type_security" {
  default = "t3a.medium"
}

variable "worker_instance_type_mysql" {
  default = "t3a.2xlarge"
}

variable "worker_instance_type_pulsar" {
  default = "t3.xlarge"
}

variable "worker_instance_type_mongo-db" {
  default = "c6a.xlarge"
}
variable "worker_instance_type_microservice" {
  default = "c6a.xlarge"
}

variable "worker_instance_type_monitoring" {
  default = "t3a.medium"
}

variable "workers_instance_count_soarcast" {
  default = 1
}

variable "workers_instance_count_saltstack" {
  default = 1
}

variable "workers_instance_count_divy" {
  default = 3
}


variable "workers_instance_count_security" {
  default = 3
}


variable "workers_instance_count_mysql" {
  default = 1
}

variable "workers_instance_count_pulsar" {
  default = 2
}

variable "workers_instance_count_mongo-db" {
  default = 2
}


variable "workers_instance_count_microservice" {
  default = 2
}

variable "workers_instance_count_monitoring" {
  default = 2
}

/*
  Divy elasticache variables
*/

variable "divy_elasticache_id" {
  type    = string
  default = "divy-dlasticache"
}

variable "divy_elasticache_parameter_group_name" {
  type    = string
  default = "default.redis7"
}

variable "divy_elasticache_node_type" {
  type    = string
  default = "cache.m5.large"
}

variable "divy_elasticache_description" {
  type    = string
  default = "divy-elasticache"
}

variable "divy_elasticache_multi_az" {
  default = false
  type    = bool
}

variable "divy_elasticache_num_nodes" {
  default = 1
  type    = number
}

/*
  SoarCast elasticache variables
*/

variable "soarcast_elasticache_id" {
  type    = string
  default = "soarcast-elasticache"
}

variable "soarcast_elasticache_parameter_group_name" {
  type    = string
  default = "default.redis7"
}

variable "soarcast_elasticache_node_type" {
  type    = string
  default = "cache.t3.micro"
}

variable "soarcast_elasticache_description" {
  type    = string
  default = "soarcast-elasticache"
}

variable "soarcast_elasticache_multi_az" {
  default = false
  type    = bool
}

variable "soarcast_elasticache_num_nodes" {
  default = 1
  type    = number
}

/*
  Divy RDS variables
*/

variable "db_name" {
  default = "postgres"
  type    = string
}

variable "db_identifier" {
  default = "wix-divy"
  type    = string
}

variable "db_engine" {
  default = "postgres"
  type    = string
}

variable "db_engine_version" {
  default = "14.2"
  type    = string
}

variable "db_username" {
  default = "pgadmin"
  type    = string
}

variable "db_subnet_group_name" {
  default = "wix-divy-rds"
  type    = string
}

variable "db_storage_type" {
  default = "gp2"
  type    = string
}

variable "db_storage" {
  default = "10"
  type    = number
}

variable "db_multi_az" {
  default = false
  type    = bool
}

variable "db_instance_class" {
  default = "db.t3.micro"
  type    = string
}


