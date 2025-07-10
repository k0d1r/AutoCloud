resource "aws_security_group" "flask_sg" {
  name        = "flask_sg"
  description = "Allow SSH, Flask and Node Exporter"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "flask" {
  ami                         = "ami-02003f9f0fde924ea"
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_id
  key_name                    = "k0d1rkey"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.flask_sg.id]

  tags = {
    Name = "FlaskInstance"
  }
}

output "instance_ip" {
  value = aws_instance.flask.public_ip
}
