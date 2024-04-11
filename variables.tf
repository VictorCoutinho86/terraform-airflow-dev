variable "kind_cluster_name" {
  type        = string
  description = "The name of the cluster."
  default     = "airflow-kind"
}

variable "kind_cluster_config_path" {
  type        = string
  description = "The location where this cluster's kubeconfig will be saved to."
  default     = "~/.kube/config"
}

variable "ingress_nginx_helm_version" {
  type        = string
  description = "The Helm version for the nginx ingress controller."
  default     = "4.10.0"
}

variable "airflow_chart_version" {
  type        = string
  description = "The Helm version for the nginx ingress controller."
  default     = "1.13.1"
}

variable "ingress_nginx_namespace" {
  type        = string
  description = "The nginx ingress namespace (it will be created if needed)."
  default     = "ingress-nginx"
}
