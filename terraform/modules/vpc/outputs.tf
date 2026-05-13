output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_id_a" {
  value = aws_subnet.public_subnet_a.id
}

output "private_subnet_id_a" {
  value = aws_subnet.private_subnet_a.id
}

output "public_subnet_id_b" {
  value = aws_subnet.public_subnet_b.id
}

output "private_subnet_id_b" {
  value = aws_subnet.private_subnet_b.id
}

output "public_route_table_id_a" {
  value = aws_route_table.public_route_table.id
}

output "private_route_table_id_b" {
  value = aws_route_table.private_route_table_b.id
}