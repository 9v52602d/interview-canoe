# Canoe-app
Canoe NodeJS App

## Development requirements
- Install nodejs or NVM(to manage multiple NodeJS versions)

## Devlopment
- Run Tests: 
    ```bash
    npm test  
    ```
- Run Dev Server: 
    ```bash
    npm start:dev  
    ```
- Run Prod:  
    ```bash
    npm start:prod  
    ```
- Run with docker-compose:  
    ```bash
    docker-compose up  
    ```
- Build the image:  
    ```bash
    docker build -t canoe-app .  
    ```
- Run simple container:  
    ```bash
    docker run -p 3000:3000 canoe-app  
    ```
## How to push an image to ECR
- Build the image: 
    ```bash
    docker build -t canoe-app .
- Authenticate with AWS: 
    ```bash
    aws ecr get-login-password --region your-region | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<region>.amazonaws.com
    ```
- Tag the image: 
    ```bash
    docker tag canoe-app:latest <aws_account_id>.dkr.ecr.<region>.amazonaws.com/canoe-app:latest
    ```
- Push the image: 
    ```bash
    docker push <aws_account_id>.dkr.ecr.<region>.amazonaws.com/canoe-app:latest
    ```
