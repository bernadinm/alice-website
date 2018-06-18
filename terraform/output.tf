output "server1_public_ip" {
  value = "${aws_instance.server1.public_ip}"
}

output "server1_public_dns" {
  value = "${aws_instance.server1.public_dns}"
}

output "server1_private_ip" {
  value = "${aws_instance.server1.private_ip}"
}

output "server1_private_dns" {
  value = "${aws_instance.server1.private_dns}"
}

output "server2_public_ip" {
  value = "${aws_instance.server2.public_ip}"
}

output "server2_public_dns" {
  value = "${aws_instance.server2.public_dns}"
}

output "server2_private_ip" {
  value = "${aws_instance.server2.private_ip}"
}

output "server2_private_dns" {
  value = "${aws_instance.server2.private_dns}"
}
