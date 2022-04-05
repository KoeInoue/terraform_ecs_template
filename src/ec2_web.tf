resource "aws_instance" "template-web" {
  ami                         = "ami-0e37e42dff65024ae"
  instance_type               = "t3a.medium"
  monitoring                  = true
  iam_instance_profile        = aws_iam_instance_profile.ecs_instance_profile.name
  subnet_id                   = aws_subnet.publics.0.id
  user_data                   = file("./service/user_data.sh")
  associate_public_ip_address = true
  key_name                    = "template-key"

  vpc_security_group_ids = [
    aws_security_group.template-web.id,
  ]

  root_block_device {
    volume_size = "30"
    volume_type = "gp2"
  }
}

resource "aws_security_group" "template-web" {
  name        = "template-web"
  description = "for template web instance"
  vpc_id      = aws_vpc.this.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
