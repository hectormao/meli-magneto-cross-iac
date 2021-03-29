variable "app_env" {
  description = "Ambiente Despliegue"
  type        = string
  default     = "dev"
}

variable "s3_tf" {
  description = "S3 Bucket para almacenar el estado del despliegue de terraform"
  type        = string
}

variable "region" {
  description = "Región de despliegue"
  type        = string
  default     = "us-east-1"
}
