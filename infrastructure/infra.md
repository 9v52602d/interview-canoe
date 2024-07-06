# Infrastructure
We use localstack to mimic AWS cloud locally and to run the code without incurring in costs, just for local development.
Terraform modules has a readme with the community format for module creation

Note: It assumes that the TLS certificate was created and we have the ARN

## Directory Structure
    - @modules
        - cloudwatch_ecs (alerts)
        - ecr (docker images repository)
        - ecs (ecs service)
        - network (vpc, nat, eip, subnets, route tables)
    - dev / (environment)

## First Steps

1) Setup LocalStack:
    ```bash
    docker-compose -f "localstack.docker-compose.yaml" up -d
    ```
2) Initialize terraform: 
    ```bash
    terraform init
    ```
3) Plan your terraform code:
    ```bash
    terraform plan -var-file="values.tfvars" 
    ```