###cloud vars
#НЕ ТРЕБУЕТСЯ 
#variable "token" {
#   type        = string
#   description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
# }



# variable "cloud_id" {
#   type        = string
#   default     = "b1g5n8seedm7iub1qbob"
#   description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
# }

# variable "folder_id" {
#   type        = string
#   default     = "aje0n6ft6vvjtf9t6eea"
#   description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
# }

variable "default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_zone2" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_cidr2" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vpc_name2" {
  type        = string
  default     = "db"
  description = "VPC network & subnet name"
}

variable "platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform VM"
}


###ssh vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFpiT6+zuhCvYRrv3IFJQnnxbD5os2mnC+6emX3+H8/V kim@kim-MS-7C02"
#   description = "ssh-keygen -t ed25519"
# }
