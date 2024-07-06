## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener) | resource |
| [aws_alb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener) | resource |
| [aws_alb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |
| [aws_ecs_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_policy.task_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_task_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecs-task-execution-role-policy-attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs-task-role-policy-attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_security_group.sg_alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_container_cpu"></a> [container\_cpu](#input\_container\_cpu) | task definition container cpu | `number` | `256` | no |
| <a name="input_container_memory"></a> [container\_memory](#input\_container\_memory) | task definition container memory | `number` | `512` | no |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | ecs container port | `number` | n/a | yes |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | Desired container count | `number` | `2` | no |
| <a name="input_env"></a> [env](#input\_env) | Env | `string` | n/a | yes |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Healtcheck path | `string` | n/a | yes |
| <a name="input_repo_url"></a> [repo\_url](#input\_repo\_url) | ECR repo URL | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Service name | `string` | n/a | yes |
| <a name="input_subnets_alb"></a> [subnets\_alb](#input\_subnets\_alb) | List of subnet IDs | `list(string)` | n/a | yes |
| <a name="input_subnets_service"></a> [subnets\_service](#input\_subnets\_service) | List of subnet IDs | `list(string)` | n/a | yes |
| <a name="input_tag"></a> [tag](#input\_tag) | Default ECS image tag | `string` | `"latest"` | no |
| <a name="input_tls_cert_arn"></a> [tls\_cert\_arn](#input\_tls\_cert\_arn) | Alb cert arn | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_arn"></a> [alb\_arn](#output\_alb\_arn) | n/a |
