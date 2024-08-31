# README
A Terraform module to install MetalLB 



## Resources

* helm_release.metallb
* helm_release.metallb-config

## Inputs

* name
* helm_repository
* chart_version
* mirror
* imagePullSecrets
* image
* ip_pool_range
* namespace

## Thanks for

* [terraform-tenzin-metallb](https://github.com/tenzin-io/terraform-tenzin-metallb)