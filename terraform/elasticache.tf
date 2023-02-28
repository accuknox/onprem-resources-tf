resource "aws_elasticache_replication_group" "divy_elasticache" {
  replication_group_id       = var.divy_elasticache_id
  description                = var.divy_elasticache_description
  node_type                  = var.divy_elasticache_node_type
  num_cache_clusters         = var.divy_elasticache_num_nodes
  parameter_group_name       = var.divy_elasticache_parameter_group_name
  subnet_group_name          = var.elasticache_subnet_group_name
  multi_az_enabled           = var.divy_elasticache_multi_az
  auth_token                 = random_string.divy_elasticache.result
  at_rest_encryption_enabled = true
  transit_encryption_enabled = true

  depends_on = [
    module.vpc
  ]
}

resource "aws_elasticache_replication_group" "soarcast_elasticache" {
  replication_group_id       = var.soarcast_elasticache_id
  description                = var.soarcast_elasticache_description
  node_type                  = var.soarcast_elasticache_node_type
  num_cache_clusters         = var.soarcast_elasticache_num_nodes
  parameter_group_name       = var.soarcast_elasticache_parameter_group_name
  subnet_group_name          = var.elasticache_subnet_group_name
  multi_az_enabled           = var.soarcast_elasticache_multi_az
  auth_token                 = random_string.soarcast_elasticache.result
  at_rest_encryption_enabled = true
  transit_encryption_enabled = true

  depends_on = [
    module.vpc
  ]
}