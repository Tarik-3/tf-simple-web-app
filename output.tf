
output "elb_address" {
  value = aws_elb.web.dns_name
}
output "addresses" {
  value = aws_instance.web.name[*].public_ip
}
output "public_subnet_id" {
  value = module.vpc_basic.public_subnet_id
}