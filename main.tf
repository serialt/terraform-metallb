#
# Metal LB
#

resource "helm_release" "metallb" {
  name             = var.metallb_release_name
  repository       = var.repository
  chart            = "metallb"
  version          = var.version
  create_namespace = true
  namespace        = var.metallb_namespace
}

resource "helm_release" "metallb_config" {
  name      = var.metallb_config_release_name
  chart     = "${path.module}/files/metallb-config"
  namespace = var.metallb_namespace

  set {
    name  = "ip_pool_range"
    value = var.ip_pool_range
  }

  depends_on = [helm_release.metallb]
}
