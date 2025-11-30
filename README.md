# argoCD-Helm

<img width="1703" height="402" alt="argoCD" src="https://github.com/user-attachments/assets/fb9dacf6-0c9a-442f-bf13-7e4ac684ca55" />


**AKS Deployment with ArgoCD via GitHub Actions**

This repository automates provisioning an Azure Kubernetes Service (AKS) cluster with Terraform and deploying the PetApp application via ArgoCD, fully orchestrated through GitHub Actions.

## Table of Contents

- [Project Overview](#project-overview)
- [Architecture & Workflow](#architecture--workflow)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

This project demonstrates:

1. Infrastructure as Code with Terraform for AKS provisioning.
2. GitOps deployment using ArgoCD.
3. CI/CD automation via GitHub Actions, no manual deployment required.

**Applications deployed:**

petapp (Docker image pulled from DockerHub)

## Architecture & Workflow
```
          ┌─────────────────────┐
          │   Developer pushes  │
          │   code / manifests  │
          └─────────┬──────────┘
                    │ Push to GitHub
                    ▼
          ┌─────────────────────┐
          │ GitHub Actions CI/CD│
          │  - Terraform AKS   │
          │  - Apply ArgoCD App│
          └─────────┬──────────┘
                    │
                    ▼
          ┌─────────────────────┐
          │      AKS Cluster    │
          │  PetApp deployed    │
          │  via ArgoCD         │
          └─────────────────────┘
```

**Workflow Summary:**

1. Push changes to GitHub repository.
2. GitHub Actions triggers:
3. Terraform provisions/updates the AKS cluster (infra/).
4. ArgoCD deploys/updates petapp using manifests from the petapp/ folder.
5. AKS cluster is up-to-date, PetApp is running automatically.

## Prerequisites

GitHub repository secrets:
```
AZURE_CLIENT_ID

AZURE_CLIENT_SECRET

AZURE_SUBSCRIPTION_ID

AZURE_TENANT_ID
```
Optional: kubectl and argocd CLI for inspection.

## Usage

**1. Push changes to GitHub.**

Updates to Terraform scripts in infra/ will provision/update AKS.
Updates to Kubernetes manifests in petapp/ will be deployed via ArgoCD.

**2. Monitor workflow:**

Go to GitHub → Actions → Select workflow → Check status.

**3. Inspect AKS Cluster & ArgoCD:**
```
# Connect to AKS (optional)
az aks get-credentials --resource-group <rg_name> --name <aks_name>
kubectl get nodes

# Check ArgoCD application
argocd app list
argocd app get petapp
```
## Folder Structure
```
argocd-aks/
├── .github/workflows/       # GitHub Actions workflows
├── infra/                   # Terraform scripts for AKS provisioning
├── argocd/                  # ArgoCD application manifests
│   └── petapp-app.yml       # ArgoCD app pointing to petapp manifests
├── petapp/                  # Kubernetes manifests for PetApp
│   ├── deployment.yml
│   ├── service.yml
│   └── ingress.yml
└── README.md
```
## Contributing

Open for contributions: new apps, CI/CD improvements, or bug fixes. Submit PRs or raise issues.


## License

**MIT License**




