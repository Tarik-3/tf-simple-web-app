

module "vpc" {
    source = "github.com/Tarik-3/tf-vpc-basic?ref=newVpc"
    server_port = 8080
    ip_to_allow_ssh = "0.0.0.0/0"
    vpc_cidr = "10.0.0.0/16"
    env = "dev"
    subnet_cidr ="10.0.24.0/24"
}
resource "aws_instance" "ec2-instance" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = module.vpc.subnet_id
    vpc_security_group_ids = [module.vpc.security_group_id]
    associate_public_ip_address = true
    key_name = aws_key_pair.ssh-key.key_name
    user_data = file("./script.sh") 

    tags = {
        Name = "${var.env}-tf_instance"
    }
}

resource "aws_key_pair" "ssh-key" {
    key_name = "tf-key-auto"
    public_key = file(var.public_key_path)
}