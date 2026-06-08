################################################################################
# EKS Pod Identity Association - Orders PostgreSQL
################################################################################



resource "aws_eks_pod_identity_association" "orders" {
  cluster_name    = data.terraform_remote_state.eks.outputs.eks_cluster_name
  namespace       = "default"
  service_account = "orders"
  role_arn        = aws_iam_role.orders_postgresql_getsecrets.arn
}

################################################################################
# Outputs
################################################################################

# Output: Orders PostgreSQL Pod Identity Association ARN
output "orders_postgresql_sa_pod_identity_association_arn" {
  description = "Pod Identity Association ARN for Orders PostgreSQL ServiceAccount (used for AWS Secrets Manager access)"
  value       = aws_eks_pod_identity_association.orders.association_arn
}