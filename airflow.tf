resource "helm_release" "airflow" {
  name       = "apache-airflow"
  repository = "https://airflow.apache.org"
  chart      = "airflow"
  version    = var.airflow_chart_version

  namespace        = "airflow"
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
    name  = "ingress.web.ingressClassName"
    value = "nginx"
  }

  set_list {
    name  = "ingress.web.hosts"
    value = ["airflow.coutinho.local"]
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
    name  = "executor"
    value = "CeleryExecutor"
  }

  depends_on = [kubernetes_secret.ssh_key_secret]
}

resource "kubernetes_secret" "ssh_key_secret" {
  metadata {
    name = "my-ssh-key"
  }

  data = {
    "id_rsa" = "${file("~/.ssh/id_rsa")}"
  }

  type = "Opaque"

  depends_on = [null_resource.wait_for_ingress_nginx]
}