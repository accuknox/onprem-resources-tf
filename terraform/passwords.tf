resource "vault_mount" "kvv2" {
  path        = "accuknox-onprem"
  type        = "kv"
  options     = { version = "2" }
  description = "Accuknox onprem secrets mount"
}

module "divy_db" {
  source = "./vault-rand-password"
  secret_name = "divy/db"
  mount_path = vault_mount.kvv2.path
  password_length = 16
}

module "divy_elasticache" {
  source = "./vault-rand-password"
  secret_name = "divy/elasticache"
  mount_path = vault_mount.kvv2.path
}

module "soarcast_elasticache" {
  source = "./vault-rand-password"
  secret_name = "soarcast/elasticache"
  mount_path = vault_mount.kvv2.path
}

resource "vault_kv_secret_v2" "vault_entry" {
  mount = vault_mount.kvv2.path
  name  = "aws/ecr"
  data_json = jsonencode(
    {
      aws_access_key_id: "",
      aws_secret_access_key: "",
    }
  )
}