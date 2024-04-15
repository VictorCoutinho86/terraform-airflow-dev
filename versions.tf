terraform {
  required_providers {

    kind = {
      source  = "tehcyx/kind"
      version = "0.4.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.29.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.13.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }
  }

  required_version = ">= 1.0.0"
}
