variable "unique_person_name" {
  description = "Euphoric person that can take this test :)"
  type        = string
  default     = "jefferson"
}

variable "location" {
  description = "Azure location that deploy resources"
  type        = string
  default     = "eastus"
}

variable "rg_name" {
  description = "Nome do resource group"
  type        = string
  default     = "rg-hiring-lab-08"
}