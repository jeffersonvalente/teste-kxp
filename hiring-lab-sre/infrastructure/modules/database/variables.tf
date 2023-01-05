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

variable "db_username" {
  description = "Database administrator username"
  type        = string
  default     = "dbadmin"
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}