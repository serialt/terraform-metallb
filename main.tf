#
# Metal LB
#

resource "helm_release" "metallb" {
  name             = "metallb"
  repository       = "https://metallb.github.io/metallb"
  chart            = "metallb"
  version          = "0.13.9"
  create_namespace = true
  namespace        = var.metallb_namespace
}

resource "helm_release" "metallb_config" {
  name      = "metallb-config"
  chart     = "${path.module}/files/metallb-config"
  namespace = var.metallb_namespace

  set {
    name  = "ip_pool_range"
    value = var.ip_pool_range
  }

  depends_on = [helm_release.metallb]
}
