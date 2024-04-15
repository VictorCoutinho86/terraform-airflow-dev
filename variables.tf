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

variable "node_image" {
  type    = string
  default = "kindest/node:v1.29.2"
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

variable "airflow_executor" {
  type    = string
  default = "CeleryExecutor"
}

variable "airflow_user_email" {
  type    = string
  default = "admin@example.com"
}

variable "airflow_first_name" {
  type    = string
  default = "admin"
}

variable "airflow_last_name" {
  type    = string
  default = "user"
}

variable "airflow_username" {
  type    = string
  default = "admin"
}

variable "airflow_password" {
  type    = string
  default = "admin"
}

variable "airflow_hosts" {
  type    = list(any)
  default = ["airflow.coutinho.local"]
}

variable "git_sync_enabled" {
  type    = string
  default = "True"
}

variable "git_sync_repo" {
  type    = string
  default = ""
}

variable "git_sync_branch" {
  type    = string
  default = "master"
}

variable "git_sync_period" {
  type    = string
  default = "600s"
}

variable "git_sync_rev" {
  type    = string
  default = "HEAD"
}

variable "git_sync_depth" {
  type    = number
  default = 1
}

variable "git_sync_max_failures" {
  type    = number
  default = 0
}

variable "git_sync_sub_path" {
  type    = string
  default = ""
}
