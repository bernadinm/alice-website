resource "aws_route53_zone" "server" {
  name = "server.alice-website.com"
}

resource "aws_route53_record" "server1" {
  zone_id = "${aws_route53_zone.server.zone_id}"
  name = "server1.server.alice-website.com"
  type = "CNAME"
  ttl = "300"
  records = ["${aws_instance.server1.public_dns}"]
}

resource "aws_route53_record" "server2" {
  zone_id = "${aws_route53_zone.server.zone_id}"
  name = "server2.server.alice-website.com"
  type = "CNAME"
  ttl = "300"
  records = ["${aws_instance.server2.public_dns}"]
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.server.zone_id}"
  name = "www.server.alice-website.com"
  type = "CNAME"
  ttl = "300"
  records = ["${aws_elb.server.dns_name}"]
}
