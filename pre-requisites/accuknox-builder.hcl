/*
    Secrets management
*/

path "sys/mounts/accuknox-onprem" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "accuknox-onprem/*" {
  capabilities = ["create", "read", "update", "delete", "list", "patch"]
}

path "sys/mounts" {
  capabilities = ["read"]
}

/*
    Policy management
*/

path "sys/policies/acl/accuknox-read-secrets" {
	capabilities = ["create", "read", "update", "delete", "list"]
}

/*
    Authentication management
*/

path "sys/auth" {
	capabilities = ["read"]
}

path "sys/auth/accuknox-onprem/k8s" {
   capabilities = ["create", "read", "update", "delete", "sudo"]
}

path "auth/accuknox-onprem/k8s/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
