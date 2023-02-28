module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"

  cluster_name    = local.cluster_name
  cluster_version = "1.24"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    disk_size = 50
  }

  node_security_group_additional_rules = {
    inress_ec2_tcp = {
      description = "Open pulsar access in private network"
      protocol    = "tcp"
      from_port   = 80
      to_port     = 80
      type        = "ingress"
      cidr_blocks = var.private_subnets
    }
  }

  eks_managed_node_groups = {
    soarcast = {
      name         = "soarcast"
      desired_size = var.workers_instance_count_soarcast
      min_size     = var.workers_instance_count_soarcast
      max_size     = var.workers_instance_count_soarcast

      instance_types = [var.worker_instance_type_soarcast]
      capacity_type  = "SPOT"
    }

    saltstack = {
      name         = "saltstack"
      desired_size = var.workers_instance_count_saltstack
      min_size     = var.workers_instance_count_saltstack
      max_size     = var.workers_instance_count_saltstack

      instance_types = [var.worker_instance_type_saltstack]
      capacity_type  = "SPOT"
    }

    divy = {
      name         = "divy"
      desired_size = var.workers_instance_count_divy
      min_size     = var.workers_instance_count_divy
      max_size     = var.workers_instance_count_divy

      instance_types = [var.worker_instance_type_divy]
      capacity_type  = "SPOT"
    }

    security = {
      name         = "security"
      desired_size = var.workers_instance_count_security
      min_size     = var.workers_instance_count_security
      max_size     = var.workers_instance_count_security

      instance_types = [var.worker_instance_type_security]
      capacity_type  = "SPOT"
    }

    mysql = {
      name         = "mysql"
      desired_size = var.workers_instance_count_mysql
      min_size     = var.workers_instance_count_mysql
      max_size     = var.workers_instance_count_mysql

      instance_types = [var.worker_instance_type_mysql]
      capacity_type  = "SPOT"
    }

    pulsar = {
      name         = "pulsar"
      desired_size = var.workers_instance_count_pulsar
      min_size     = var.workers_instance_count_pulsar
      max_size     = var.workers_instance_count_pulsar

      instance_types = [var.worker_instance_type_pulsar]
      capacity_type  = "SPOT"
    }

    mongo-db = {
      name         = "mongo-db"
      desired_size = var.workers_instance_count_mongo-db
      min_size     = var.workers_instance_count_mongo-db
      max_size     = var.workers_instance_count_mongo-db

      instance_types = [var.worker_instance_type_mongo-db]
      capacity_type  = "SPOT"
    }

    microservices = {
      name         = "microservices"
      desired_size = var.workers_instance_count_microservice
      min_size     = var.workers_instance_count_microservice
      max_size     = var.workers_instance_count_microservice

      instance_types = [var.worker_instance_type_microservice]
      capacity_type  = "SPOT"
    }

    monitoring = {
      name         = "monitoring"
      desired_size = var.workers_instance_count_monitoring
      min_size     = var.workers_instance_count_monitoring
      max_size     = var.workers_instance_count_monitoring

      instance_types = [var.worker_instance_type_monitoring]
      capacity_type  = "SPOT"
    }
  }

}
