## EC2
variable "ami" {
  default = "ami-0ff21806645c5e492"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "volume_size" {
  default = "8"
}

## RDS
variable "instance_class" {
  default = "db.t2.micro"
}

variable "database_name" {
  default = "wordpress"
}

variable "username" {
  default = "root"
}

variable "password" {
  default = "password"
}
