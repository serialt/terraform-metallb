#
# Metal LB
#

resource "helm_release" "metallb" {
  name             = var.name
  repository       = var.helm_repository
  chart            = "metallb"
  version          = var.chart_version
  namespace        = var.namespace
}

resource "helm_release" "metallb_config" {
  name      = "${var.name}-config"
  chart     = "${path.module}/files/metallb-config"
  namespace = var.namespace

  set {
    name  = "ip_pool_range"
    value = var.ip_pool_range
  }

  depends_on = [helm_release.metallb]
}
