resource "aws_instance" "main" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_ids[0]

  tags = {
    Name = "Main EC2 Instance"
  }
}
