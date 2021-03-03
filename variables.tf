variable "rg" {
  default = "terraform-lab2"
}

variable "loc" {
  description = "Default Azure region"
  default = "West Europe"
}

variable "tags" {
  type = "map"
  default = {
      source = "citadel"
      env = "training"
  }
}