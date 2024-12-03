resource "aws_instance" "main" {
  ami                    = "ami-0614680123427b75e" # Amazon Linux 2 AMI
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet_ids[0]
  key_name               = aws_key_pair.main.key_name
  vpc_security_group_ids = [aws_security_group.main.id]

  tags = {
    Name       = "${var.project_name}-ec2-instance"
    can_delete = "true"
  }
}

resource "aws_security_group" "main" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_inbound_cidr_blocks
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.allowed_vpc_cidr_blocks # Allow traffic from inside the VPC only
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "${var.project_name}-ec2-sg"
    can_delete = "true"
  }
}

# Create Key Pair
resource "aws_key_pair" "main" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_ed25519.pub") # Path to your SSH public key
}
