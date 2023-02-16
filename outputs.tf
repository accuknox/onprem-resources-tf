output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "vpc_name" {
  description = "Kubernetes vpc Name"
  value       = module.vpc.name
}

output "divy_elasticache_password" {
  description = "divy elasticache password"
  value       = random_string.divy_elasticache.result
}

output "divy_db_password" {
  description = "divy database password"
  value       = random_string.divy_db.result
}

output "soarcast_elasticache_password" {
  description = "soarcast elasticache password"
  value       = random_string.soarcast_elasticache.result
}


output "verif" {
  value = aws_ses_domain_dkim.ses_domain_dkim.dkim_tokens
}



output "name" {
  value       = aws_iam_user.user.name
  description = "IAM user name"
}

output "arn" {
  value       = aws_iam_user.user.arn
  description = "ARN of the IAM user"
}

output "login" {
  value       = aws_iam_access_key.user.id
  description = "IAM Access Key of the created user, used as the SMTP user name"
}

output "password" {
  value       = nonsensitive(aws_iam_access_key.user.ses_smtp_password_v4)
  description = "The secret access key converted into an SES SMTP password"

}