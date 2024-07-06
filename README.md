# CanoeIntelligenceApp Interview

## Required tools for development
- Terraform
- Docker
- docker-compose
- NodeJS

## Install pre-commit hooks
    brew install pre-commit

## Active hooks
- Runs prettierjs in the app code
- Validates terraform
- Validates branch naming conventions (feature/, hotfix/, bugfix/)
- Enforces Shift-left approach as the hook runs unit tests before even it commits the code locally

## Docs
- [APP](app/app.md)
- [INFRASTRUCTURE](infrastructure/infra.md)

## Diagram
![Canoe App Diagram](canoe-app-diagram.jpg)