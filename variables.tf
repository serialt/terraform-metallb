variable "name" {
  type    = string
  default = "metallb"

}

variable "helm_repository" {

  type    = string
  default = "https://metallb.github.io/metallb"
}

variable "chart_version" {
  type    = string
  default = "0.13.9"

}

variable "image_registry" {
  type    = string
  default = "docker.io"
}

variable "image" {
  type = any
  default = {
    controller = {
      repository = "metallb/controller"
      tag        = ""
    }
    speaker = {
      repository = "metallb/speaker"
      tag        = ""
    }
  }

}

variable "ip_pool_range" {
  type        = string
  description = "The IP address pool range given to MetalLB."
}

variable "namespace" {
  type        = string
  default     = "metallb-system"
  description = "The namespace for MetalLB deployment."
}
