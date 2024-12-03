# Terraform Configuration for Deploying RDS with Postgres 16, VPC, and Bastion Host 🚀

This repository contains Terraform configuration for setting up a **PostgreSQL 16** database with an **RDS instance**, a **dedicated VPC**, and a **bastion host** for secure SSH access to the private network. 🛠️

## Architecture Overview 🏗️

- **VPC**: A dedicated Virtual Private Cloud (VPC) with public and private subnets.
- **RDS Instance**: A PostgreSQL 16 database running in a private subnet.
- **Bastion Host**: A securely configured EC2 instance in a public subnet, used to SSH into the private network.

## Features ✨

- ✅ **PostgreSQL 16** installed and configured on RDS.
- ✅ **Dedicated VPC** with custom CIDR block and subnet setup.
- ✅ **Bastion Host** in a public subnet to manage access securely.
- ✅ **Security Groups** to restrict access and allow secure communication between the bastion and RDS instance.
- ✅ **Terraform managed** infrastructure for easy deployment and management.

## Prerequisites ⚠️

Before using this repository, ensure you have the following:

- 🖥️ **Terraform** installed (v1.0 or later).
- 💻 **AWS CLI** configured with appropriate permissions.
- 🌐 A public IP address for SSH access to the bastion host.

## How to Use 📚

### 1. Clone the Repository

```bash
git clone https://github.com/TerraformTestLab/StacksExchange
cd StacksExchange
```

### 2. Configure Variables

Create a terraform.tfvars file and set the following variables:

```hcl
key_name = "your-ssh-key-name"  # Your SSH key name for accessing the bastion host
db_username = "admin"      # Database username for RDS
db_password = "yourpassword"  # Database password for RDS
allowed_inbound_cidr_blocks = ["xxx.xxx.xxx.xxx/32"] # Allowed IPs which could connect to the bastian hosts
```

### 3. Initialize Terraform

Run the following command to initialize the Terraform workspace:

```shel
terraform init
```

### 4. Apply the Terraform Configuration

Execute the following command to create the infrastructure:

```shel
terraform apply
```

Terraform will show a plan of the resources it will create. Type `yes` to approve the changes.

### 5. Access the Bastion Host 🖥️

Once the resources are deployed, you can connect to the bastion host using the SSH command provided in the Terraform output.

```shel
ssh -i ~/.ssh/your-ssh-key.pem ec2-user@<bastion-host-ip>
```

### 6. Connect to the RDS Instance from the Bastion Host 🔑

After SSHing into the bastion host, use the following command to connect to your RDS PostgreSQL 16 instance:

```shel
psql --host=<rds-endpoint> --port=5432 --username=<db-username> --dbname=postgres
```

### 7. Outputs 📤

After a successful terraform apply, the following outputs will be displayed:

- Bastion Host SSH Command: A command to SSH into the bastion host.
- RDS Endpoint: The endpoint for connecting to the PostgreSQL RDS instance.

## Clean Up 🧹

To destroy all the resources created by Terraform, run the following command:

```shel
terraform destroy
```

This will delete the VPC, RDS instance, and the bastion host.

## Contributing 🤝

Feel free to fork this repository, make improvements, and open a pull request. Contributions are welcome!

## License 📜

This project is licensed under the MIT License - see the LICENSE file for details.
