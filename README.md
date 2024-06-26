## Index / Índice

- [English](#english-readme)
  - [Overview](#english-readme)
  - [Features](#features)
  - [Requirements](#requirements)
  - [Usage](#usage)
    
- [Español](#readme-en-español)
  - [Visión General](#readme-en-español)
  - [Características](#características)
  - [Requisitos](#requisitos)
  - [Uso](#uso)

---

## English README

# AWS Infrastructure as Code Automation with Terraform

### Overview

> This project automates setting up and managing AWS infrastructure using Terraform. It includes setups for creating a VPC, public and private EC2 instances, and an RDS database. Terraform's Infrastructure as Code (IaC) approach makes deploying and maintaining cloud resources simple, ensuring they're consistent and easy to scale.

### Features

- **VPC Configuration**: Establishes a secure and isolated network environment using AWS VPC.
- **Subnets**: Defines public and private subnets within the VPC to host EC2 instances and the RDS database.
- **EC2 Instances**: Deploys both public and private EC2 instances to cater to various application needs.
- **RDS Database**: Configures a relational database with AWS RDS, supporting multiple database engines such as MySQL, PostgreSQL, etc.
- **Infrastructure as Code**: Manages AWS resources using declarative configuration files, enhancing reproducibility and reducing human errors.

### Requirements

- AWS account with appropriate permissions to create VPCs, EC2 instances, and RDS databases.
- Terraform installed locally. You can download it from [Terraform Downloads](https://www.terraform.io/downloads.html).
- Create an S3 bucket in AWS to store Terraform state.

### Usage

1. Clone the repository:

       git clone https://github.com/LizzyMaken/Terraform-AWS-IaC.git

       cd Terraform-AWS-IaC

2. Modify the `main.tf` file and replace the bucket name with the one you have created in the `backend "s3"` block:
 
    ```hcl
    terraform {
      backend "s3" {
        bucket = "YOUR_BUCKET_NAME"
        key    = "terraform.tfstate"
        region = "us-east-1"
      }
    }
    ```

You can choose to modify `main.tf` and other configuration files in the `modules/` directory as needed to match your AWS account settings and requirements.

3. Initialize Terraform:

       terraform init

4. Review the execution plan:

       terraform plan

5. Apply the changes:

       terraform apply

6. After deployment, ensure all resources have been provisioned correctly in the AWS Management Console.

---

## README en Español

# Automatización de Infraestructura como Código en AWS con Terraform

### Visión General

> Este proyecto automatiza el despliegue y gestión de infraestructura en AWS utilizando Terraform. Incluye configuraciones para crear una VPC, instancias EC2 públicas y privadas, y una base de datos RDS. El enfoque de Terraform como Infraestructura como Código (IaC) facilita la implementación y mantenimiento de recursos en la nube, garantizando que sean consistentes y fáciles de escalar.

### Características

- **Configuración de VPC**: Establece un entorno de red seguro y aislado utilizando AWS VPC.
- **Subredes**: Define subredes públicas y privadas dentro de la VPC para alojar instancias EC2 y la base de datos RDS.
- **Instancias EC2**: Despliega instancias EC2 públicas y privadas según las necesidades de la aplicación que se vaya a desplegar.
- **Base de Datos RDS**: Configura una base de datos relacional con AWS RDS, compatible con varios motores de base de datos como MySQL, PostgreSQL, etc.
- **Infraestructura como Código**: Gestiona recursos de AWS utilizando archivos de configuración declarativos, mejorando la reproducibilidad y reduciendo errores humanos.

### Requisitos

- Cuenta de AWS con permisos adecuados para crear VPCs, instancias EC2 y bases de datos RDS.
- Terraform instalado localmente. Puedes descargarlo desde [Descargas de Terraform](https://www.terraform.io/downloads.html).
- Crea un bucket S3 en AWS para almacenar el estado de Terraform.

### Uso

1. Clona el repositorio:

       git clone https://github.com/LizzyMaken/Terraform-AWS-IaC.git

       cd Terraform-AWS-IaC


2. Modifica el archivo `main.tf` y reemplaza el nombre del bucket con el que tú hayas creado en el bloque `backend "s3"`:

    ```hcl
    terraform {
      backend "s3" {
        bucket = "YOUR_BUCKET_NAME"
        key    = "terraform.tfstate"
        region = "us-east-1"
      }
    }
    ```
    
Si lo deseas, puedes modificar el `main.tf` y otros archivos de configuración en el directorio `modules/` según sea necesario para que coincidan con la configuración de tu cuenta de AWS y tus requisitos.

3. Inicializa Terraform:

       terraform init

4. Revisa el plan de ejecución:

       terraform plan

5. Aplica los cambios:

       terraform apply

6. Después del despliegue, asegúrate de que todos los recursos se hayan creado correctamente en la Consola de AWS.

