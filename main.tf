#
# Metal LB
#

resource "helm_release" "metallb" {
  name       = var.name
  repository = var.helm_repository
  chart      = "metallb"
  version    = var.chart_version
  namespace  = var.namespace

  set {
    name  = "controller.image.repository"
    value = "${var.mirror}/${var.image.controller.repository}"
  }
  set {
    name  = "controller.image.tag"
    value = "${var.mirror}/${var.image.controller.tag}"
  }
  set {
    name  = "speaker.image.repository"
    value = "${var.mirror}/${var.image.speaker.repository}"
  }
  set {
    name  = "speaker.image.tag"
    value = "${var.mirror}/${var.image.speaker.tag}"
  }
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
