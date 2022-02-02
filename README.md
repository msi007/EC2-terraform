ssh-keygen -f saiful-key-pair
terraform init
terraform plan -out terraform.out
terraform apply terraform.out
