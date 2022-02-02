variable "access_key" {}
variable "secret_key" {}
variable "region" {
    default = "us-east-1"
}

variable "ami_id" {
    default = {
        us-east-1 ="ami-0b0af3577fe5e3532"
    }
}

variable "PRIVATE_KEY_PATH" {
  default = "saiful-key-pair"
}

variable "PUBLIC_KEY_PATH" {
  default = "saiful-key-pair.pub"
}

variable "EC2_USER" {
  default = "ec2-user"
}