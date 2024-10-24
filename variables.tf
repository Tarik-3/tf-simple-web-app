
# variable "server_name" {
#     description = "This is the name of the server"
#     type = string
#     default = "Server_Example"
# }

variable "key_name" {
  description = "The key pair of the instance"
  type        = string
}
variable "ami" {
  type        = string
  description = "The AMI "
  default     = "ami-40d28157"
}

variable "name" {
  type        = set(string)
  description = "The names of instances"
  default     = ["web-1", "web-2"]

}

# variable "region" {
#     type = string
#     description = "The region of the instance"

# }

variable "server_port" {
  description = "The port of the server"
  default     = 8080
}

variable "instance_type" {
  type        = string
  description = "The type of the instance"
  default     = "t2.micro"
}
