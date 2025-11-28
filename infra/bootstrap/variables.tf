variable "resource_group_name" {
    default = "my_rg"
    type = string
}

variable "location" {
    default = "Australiasoutheast"
    type = string
}

variable "storage_account_name" {
    default = "tfstatestorage420"
    type = string
}

variable "storage_container_name" {
    default = "terraform-state"
    type = string
}

