
resource "random_string" "password" {
  length  = var.password_length
  special = false
}


resource "vault_kv_secret_v2" "vault_entry" {
  mount = var.mount_path
  name  = var.secret_name
  data_json = jsonencode(
    {
      password = random_string.password.result
    }
  )
}