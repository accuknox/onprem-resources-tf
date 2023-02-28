resource "vault_auth_backend" "k8s" {
  type = "kubernetes"
  path = "accuknox-onprem/k8s"
}

resource "vault_kubernetes_auth_backend_config" "example" {
  backend                = vault_auth_backend.k8s.path
  kubernetes_host        = "${module.eks.cluster_endpoint}:443"
  kubernetes_ca_cert     = base64decode(module.eks.cluster_certificate_authority_data)
  disable_iss_validation = "true"
  disable_local_ca_jwt   = "true"
}

resource "vault_kubernetes_auth_backend_role" "accuknox-role" {
  backend                          = vault_auth_backend.k8s.path
  role_name                        = vault_policy.accuknox-policy.name
  bound_service_account_names      = ["*"]
  bound_service_account_namespaces = ["*"]
  token_ttl                        = 3600
  token_policies                   = ["default", vault_policy.accuknox-policy.name]
}


resource "vault_policy" "accuknox-policy" {
  name = "accuknox-read-secrets"

  policy = <<EOT
path "accuknox-onprem/*" {
  capabilities = ["create", "read", "update", "delete", "list", "patch"]
}
EOT
}