# Infraestructura Cross a la solución de Magneto API

En este reositorio se alamacenan los archivos de IAC para el API de Varificador Mutante para Magneto

## Despliegue

Para el despliegue de la infraestructura Cross se usa `terraform`, el código IAC esta almacenado en el directorio `terraform` que esta ubicado en la raíz del proyecto
**Nota:** La version de `terraform` usada es **v0.14.9**

### Creación Workspace de desarrollo

Para la creación de la infraestructura en ambiente de dev es importante crear un worksapce para tal fin y asi no tener inconsistencias al momento de desplegar la misma infra en otros ambientes en la misma cuenta de AWS.

```bash
terraform workspace new dev
```

### Plan de despliegue en ambiente dev

```bash
cd terraform
terraform init
```

### Despliegue en ambiente dev

```bash
cd terraform
terraform plan -var-file tfvars/dev.tfvars
```
