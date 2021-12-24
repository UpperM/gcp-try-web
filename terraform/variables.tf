variable "gcp_project" {
  type        = string
  default     = "gcp-try-web"
}
variable "gcp_zone" {
  type        = string
  default     = "europe-west1-b"
}

variable "gcp_region" {
  type        = string
  default     = "europe-west1"
}

variable "instance_type" {
  type        = string
  default     = "f1-micro"
}

variable "instances" {
    type = list(object({
        hostname        = string
        network         = string
        startup_script  = string
      }))

    default = [
      {
        hostname = "nginx-a"
        network = "web-network"
        startup_script = "curl -s https://raw.githubusercontent.com/UpperM/gcp-try-web/main/scripts/deploy_nginx.sh | bash"
      },
      {
        hostname = "nginx-b"
        network = "web-network"
        startup_script = "curl -s https://raw.githubusercontent.com/UpperM/gcp-try-web/main/scripts/deploy_nginx.sh | bash"
      },
      {
        hostname = "nginx-c"
        network = "web-network"
        startup_script = "curl -s https://raw.githubusercontent.com/UpperM/gcp-try-web/main/scripts/deploy_nginx.sh | bash"
      },
      {
        hostname = "varnish-a"
        network = "web-network"
        startup_script = "curl -s https://raw.githubusercontent.com/UpperM/gcp-try-web/main/scripts/deploy_varnish.sh | bash"
      },
      {
        hostname = "varnish-b"
        network = "web-network"
        startup_script = "curl -s https://raw.githubusercontent.com/UpperM/gcp-try-web/main/scripts/deploy_varnish.sh | bash"
      },
      {
        hostname = "haproxy-a"
        network = "web-network"
        startup_script = "curl -s https://raw.githubusercontent.com/UpperM/gcp-try-web/main/scripts/deploy_haproxy.sh | bash"
      }
    ]
}
