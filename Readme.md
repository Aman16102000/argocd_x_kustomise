ArgoCD with Kustomize

This repository contains the configuration for deploying applications using ArgoCD and Kustomize. It follows a structured approach to managing different environments (staging, production) and infrastructure automation using Terraform.

Project Structure

.
├── apps                   # ArgoCD Application definitions
│   ├── beta              # Beta environment applications
│   └── prod              # Production environment applications
│
├── argocd-config          # ArgoCD configuration files
│   └── projects          # Project-level configurations
│       └── staging-project.yaml
│
├── base                   # Base Kustomize configurations (common across environments)
│   ├── deployment.yaml   # Base Deployment manifest
│   ├── ingress.yaml      # Base Ingress configuration
│   ├── kustomization.yaml
│   ├── secret.yaml       # Base Secret configuration
│   └── service.yaml      # Base Service definition
│
├── overlays               # Environment-specific overlays for Kustomize
│   ├── prod              # Production-specific configurations
│   │   ├── service1
│   │   └── service2
│   └── staging           # Staging-specific configurations
│       ├── auth
│       │   ├── deployment-patch.yaml
│       │   ├── ingress-patch.yaml
│       │   ├── kustomization.yaml
│       │   └── service-patch.yaml
│       ├── company
│       │   ├── deployment-patch.yaml
│       │   ├── ingress-patch.yaml
│       │   ├── kustomization.yaml
│       │   └── service-patch.yaml
│       └── kustomization.yaml
│
├── terraform              # Infrastructure provisioning using Terraform
│   ├── main.tf           # Main Terraform configuration
│   ├── provider.tf       # Terraform provider configuration
│   └── variables.tf      # Terraform variables
│
