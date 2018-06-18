variable "aws_access_key_id" {
  default = ""
}

variable "aws_secret_access_key" {
  default = ""
}

variable "key_name" {
  default = ""
}

variable "availability_zone" {
  default = {
    "primary": "us-west-1a",
    "secondary": "us-east-1a"
  }
}

variable "instance_type" {
  default = "t1.micro"
}
