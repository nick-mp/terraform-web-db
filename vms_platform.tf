variable "wm_web_img" {
  type    = string
  default = "ubuntu-2404-lts-oslogin"
}

#--------vms_resources-------------------


variable "vms_resources" {
  type = map(map(any))
}


variable "metadata" {
  type = object({
    serial-port-enable = number,
    ssh-keys           = string
  })
  description = "ssh-keys"
}



# variable "wm_web_cores" {
#   type    = number
#   default = 2
# }

# variable "wm_web_memory" {
#   type    = number
#   default = 1
# }

# variable "wm_web_fraction" {
#   type    = number
#   default = 5
# }

# variable "wm_web_size_hdd" {
#   type    = number
#   default = 10
# }

# variable "wm_web_enable_sc" {
#   type    = bool
#   default = true
# }

# #_----------------------second vm---------------------------

# variable "wm_db_img" {
#   type    = string
#   default = "ubuntu-2404-lts-oslogin"
# }

# variable "wm_db_cores" {
#   type    = number
#   default = 2
# }

# variable "wm_db_memory" {
#   type    = number
#   default = 2
# }

# variable "wm_db_fraction" {
#   type    = number
#   default = 20
# }

# variable "wm_db_size_hdd" {
#   type    = number
#   default = 10
# }

# variable "wm_db_enable_sc" {
#   type    = bool
#   default = true
# }