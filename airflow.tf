resource "helm_release" "airflow" {
  name       = "apache-airflow"
  repository = "https://airflow.apache.org"
  chart      = "airflow"
  version    = var.airflow_chart_version

  namespace        = kubernetes_namespace.airflow.metadata[0].name
  wait             = false
  create_namespace = true
  force_update     = true
  cleanup_on_fail  = true
  timeout          = 1500

  set {
    name  = "ingress.web.enabled"
    value = "true"
  }

  set {
    name  = "exeutor"
    value = var.airflow_executor
  }

  set {
    name  = "ingress.web.ingressClassName"
    value = "nginx"
  }

  set_list {
    name  = "ingress.web.hosts"
    value = var.airflow_hosts
  }

  set {
    name  = "statsd.enabled"
    value = "false"
  }

  set {
    name  = "flower.enabled"
    value = "false"
  }

  set {
    name  = "webserverSecretKey"
    value = "8996c19d1a7080b5557727b6"
  }

  set {
    name  = "webserver.defaultUser.enabled"
    value = "True"
  }

  set {
    name  = "webserver.defaultUser.email"
    value = var.airflow_user_email
  }

  set {
    name  = "webserver.defaultUser.firstName"
    value = var.airflow_first_name
  }

  set {
    name  = "webserver.defaultUser.lastName"
    value = var.airflow_last_name
  }

  set_sensitive {
    name  = "webserver.defaultUser.password"
    value = var.airflow_password
  }

  set {
    name  = "webserver.defaultUser.username"
    value = var.airflow_username
  }

  set {
    name  = "webserver.defaultUser.role"
    value = "Admin"
  }

  set {
    name  = "dags.gitSync.enabled"
    value = var.git_sync_enabled
  }

  set {
    name  = "dags.gitSync.branch"
    value = var.git_sync_branch
  }

  set {
    name  = "dags.gitSync.repo"
    value = var.git_sync_repo
  }

  set {
    name  = "dags.gitSync.sshKeySecret"
    value = kubernetes_secret.ssh_key_secret.metadata[0].name
  }

  set {
    name  = "dags.gitSync.rev"
    value = var.git_sync_rev
  }

  set {
    name  = "dags.gitSync.ref"
    value = var.git_sync_rev
  }

  set {
    name  = "dags.gitSync.period"
    value = var.git_sync_period
  }


  set {
    name  = "dags.gitSync.maxFailures"
    value = var.git_sync_max_failures
  }

  set {
    name  = "dags.gitSync.depth"
    value = var.git_sync_depth
  }

  set_sensitive {
    name  = "dags.gitSync.subPath"
    value = var.git_sync_sub_path
  }

  depends_on = [null_resource.wait_for_ingress_nginx]
}

resource "kubernetes_namespace" "airflow" {
  metadata {

    name = "airflow"
  }
  depends_on = [kind_cluster.default]
}

resource "kubernetes_secret" "ssh_key_secret" {
  metadata {
    name      = "airflow-ssh-git-secret"
    namespace = kubernetes_namespace.airflow.metadata[0].name
  }

  data = {
    "id_rsa" = "${file("~/.ssh/id_rsa")}"
  }

  type = "Opaque"

  depends_on = [kubernetes_namespace.airflow]
}
