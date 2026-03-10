resource "aws_eks_node_group" "private_nodes" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${local.name}-private-ng"
  node_role_arn   = aws_iam_role.eks_nodegroup.arn
  subnet_ids      = data.terraform_remote_state.vpc.outputs.private_subnet_ids

  instance_types = var.node_instance_type
  capacity_type = var.node_capacity_type
  ami_type = "AL2023_x86_64_STANDARD"
  disk_size = var.node_disk_size
  scaling_config {
    desired_size = 3
    max_size     = 6
    min_size     = 1
  }

  update_config {
    max_unavailable_percentage = 33
  }

  force_update_version = true

  labels = {
    "env" = var.environment_name
    "team" = var.business_division
  }

  tags = merge(var.tags, {Name = "${local.name}-private-ng"
  Environment = var.environment_name})
  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}