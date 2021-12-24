# gcp-try-web

Little try of deployment of HAProxy, Nginx and Varnish on GCP with Terraform

## How to Use

```sh
git clone https://github.com/UpperM/gcp-try-web.git
cd gcp-try-web/terraform
terraform init
gcloud auth application-default login
gcloud projects create gcp-try-web
terrform apply
```
## To improve :

* Firewall rule
* Wait for VPC end of creation before create instances
* Usage of Ansible with auto inventory from GCP
