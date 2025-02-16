

data "aws_eks_cluster" "eks" {
  name = "Eks-cluster"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.81.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }

  }
  backend "s3" {
    bucket = "argoXkustomize-terraform-statefile"
    key    = "infra/ecr.tfstate"
    region = "us-west-2"
  }


  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1staging1"
      args        = ["eks", "get-token", "--cluster-name Eks-cluster"]
      command     = "aws"
    }
  }
}

provider "kubernetes" {
      host                   = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1staging1"
      args        = ["eks", "get-token", "--cluster-name Eks-cluster"]
      command     = "aws"
    }

}
