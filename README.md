ssh-keygen -f saiful-key-pair <br>
terraform init
terraform plan -out terraform.out
terraform apply terraform.out
