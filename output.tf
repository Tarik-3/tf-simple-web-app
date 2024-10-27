
output "ec2_public_id" {
    value = aws_instance.ec2-instance.public_ip
}
