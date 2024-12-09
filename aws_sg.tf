resource "aws_security_group" "porteiro_db" {
  name        = "bia-db"
  description = "database"
  vpc_id      = "vpc-0d84787c58a1fa2c0"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.porteiro.id]
    self = false
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = false
  }

  tags = {}
}

resource "aws_security_group" "porteiro" {
  name        = "porteiro"
  description = "acesso ao porteiro por ssh"
  vpc_id      = "vpc-0d84787c58a1fa2c0"

  ingress {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    ipv6_cidr_blocks  = [var.my_ip]
  }
}