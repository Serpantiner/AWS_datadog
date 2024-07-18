resource "aws_instance" "k8s_nodes" {
  count         = var.k8s_node_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = element(var.subnet_ids, count.index % length(var.subnet_ids))

  tags = {
    Name = "K8s Node ${count.index + 1}"
  }
}
