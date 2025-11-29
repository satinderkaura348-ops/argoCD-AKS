# argoCD-Helm

<img width="1115" height="555" alt="argoCD-aks" src="https://github.com/user-attachments/assets/537df8a8-ee68-46b0-b717-363dd03f1f99" />

**AKS Deployment with ArgoCD via GitHub Actions**

This repository automates provisioning an Azure Kubernetes Service (AKS) cluster with Terraform and deploying the PetApp application via ArgoCD, fully orchestrated through GitHub Actions.

## Table of Contents

- [Project Overview](#project-overview)
- [Architecture & Workflow](#architecture--workflow)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)

## Project Overview

This project demonstrates:

Infrastructure as Code with Terraform for AKS provisioning.

GitOps deployment using ArgoCD.

CI/CD automation via GitHub Actions, no manual deployment required.

Applications deployed:

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

** Workflow Summary: **

Push changes to GitHub repository.

GitHub Actions triggers:

Terraform provisions/updates the AKS cluster (infra/).

ArgoCD deploys/updates petapp using manifests from the petapp/ folder.

AKS cluster is up-to-date, PetApp is running automatically.

## Prerequisites

GitHub repository secrets:

AZURE_CLIENT_ID

AZURE_CLIENT_SECRET

AZURE_SUBSCRIPTION_ID

AZURE_TENANT_ID

Optional: kubectl and argocd CLI for inspection.

## Usage

Push changes to GitHub.

Updates to Terraform scripts in infra/ will provision/update AKS.

Updates to Kubernetes manifests in petapp/ will be deployed via ArgoCD.

Monitor workflow:

Go to GitHub → Actions → Select workflow → Check status.

Inspect AKS Cluster & ArgoCD:

# Connect to AKS (optional)
az aks get-credentials --resource-group <rg_name> --name <aks_name>
kubectl get nodes

# Check ArgoCD application
argocd app list
argocd app get petapp

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

