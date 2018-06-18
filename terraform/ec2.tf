resource "aws_security_group" "server" {
  name = "server"
  description = "security group for server"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "server1" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.server.name}"]
}

resource "aws_instance" "server2" {
  ami = "${var.ami}"
  availability_zone = "${var.availability_zone.secondary}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.server.name}"]
}

resource "aws_elb" "server" {
  name = "server"
  availability_zones = ["${var.availability_zone.primary}","${var.availability_zone.secondary}"],

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }
  instances = ["${aws_instance.server2.id}","${aws_instance.server1.id}"]
}
