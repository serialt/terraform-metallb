variable "name" {
  type = string
  default = "metallb"

}

variable "chart_repository" {
  
  type =  string
  default = "https://metallb.github.io/metallb"
}

variable "chart_version" {
  type = string
  default = "0.13.9"
  
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
