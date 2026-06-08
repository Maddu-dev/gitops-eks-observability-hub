

# ------------------------------------------------------------------------------
# Output the EKS Cluster Security Group ID
# Used by downstream services like RDS, ElastiCache, etc.
# ------------------------------------------------------------------------------
output "eks_cluster_security_group_id" {
    value = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
    description = "Security group associated with the EKS cluster (used for control plane to node communication)"
}