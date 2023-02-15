resource "random_string" "divy_elasticache" {
  length  = 32
  special = false
}

resource "random_string" "soarcast_elasticache" {
  length  = 32
  special = false
}

resource "random_string" "divy_db" {
  length  = 16
  special = false
}
