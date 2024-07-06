# Create ECR Repo
module "ecr_repo" {
  source   = "../@modules/ecr"
  ecr_name = "canoe-app"
}

# Create network resources ( 3 pub subnets, 3 priv subnets )
module "network" {
  depends_on = [
    module.ecr_repo
  ]
  source               = "../@modules/network"
  aws_region           = var.aws_region
  env                  = var.env
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr

}

# Adding ECS Cluster here as it's just 1 resource,
# but It can be added into the network module or into a single module just for the cluster
# Adds ALB
module "ecs" {
  depends_on = [
    module.network
  ]

  source            = "../@modules/ecs"
  aws_region        = var.aws_region
  env               = var.env
  service_name      = var.service_name
  repo_url          = module.ecr_repo.repository_url
  container_port    = 80
  subnets_service   = module.network.private_subnets_id
  subnets_alb       = module.network.public_subnets_id
  tls_cert_arn      = "arn::::"
  health_check_path = "/healthcheck"
  vpc_id = module.network.vpc_id

}

# Detect stopped containers and notifiy incident management dashboard
module "ecs_events" {

  depends_on = [
    module.ecs
  ]
  source           = "../@modules/cloudwatch_ecs"
  ecs_service_list = ["${var.service_name}-service-${var.env}"]
  env = var.env
  incident_management_webhook = "https://pagerduty.com"
}
