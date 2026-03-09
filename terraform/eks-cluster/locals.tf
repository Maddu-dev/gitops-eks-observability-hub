locals {
    owners = var.business_division

    environment_name = var.environment_name

    name = "${local.owners}-${local.environment_name}"

    eks_cluster_name = "${local.name}-${var.cluster_name}"
}