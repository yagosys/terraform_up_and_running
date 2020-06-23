data "aws_vpc" "current" {
}


resource "aws_ec2_transit_gateway" "example" {
  description 			  = "example transit gateway"
  amazon_side_asn 		  = "64512"
  auto_accept_shared_attachments  = "disable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support			  = "enable"
  vpn_ecmp_support		  = "enable"

}

output "tgw" {
value = aws_ec2_transit_gateway.example

 }

output "vpc_id" {
value = data.aws_vpc.default.id

}

resource "aws_ec2_transit_gateway_vpc_attachment" "example" {
transit_gateway_id = "${aws_ec2_transit_gateway.example.id}"
vpc_id = data.aws_vpc.default.id
dns_support = "enable"
subnet_ids = data.aws_subnet_ids.default.ids

}

output "aws_ec2_transit_gateway_vpc_attachment" {
value = data.aws_ec2_transit_gateway_vpc_attachment
}
