variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}

variable "AMIs" {
  type = map(any)
  default = {
    us-east-1 = "ami-0a8b4cd432b1c3063"
    us-west-2 = "ami-00f7e5c52c0f43726"

  }
}

variable "USER" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = "dovekey.pub"
}

variable "PRIV_KEY" {
  default = "dovekey"
}

variable "MYIP" {
  default = "87.79.48.18/32"
}

variable "SG" {
  default = ["sg-018bb52a4c9ba7dc3"]
}
