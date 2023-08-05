variable "metallb_release_name" {
  type = string
  default = "metallb"

}
  
variable "metallb_config_release_name"{
  type = string
  default = "metallb-config"
}

variable "repository" {
  
  type =  string
  default = "https://metallb.github.io/metallb"
}

variable "version" {
  type = string
  default = "0.13.9"
  
}

variable "ip_pool_range" {
  type        = string
  description = "The IP address pool range given to MetalLB."
}

variable "metallb_namespace" {
  type        = string
  default     = "metallb-system"
  description = "The namespace for MetalLB deployment."
}
