resource "aws_securityhub_account" "example" {
}
  data "aws_region" "current" {
  }


resource "aws_securityhub_product_subscription" "example" {
  depends_on    = [aws_securityhub_account.example]
  product_arn = "arn:aws:securityhub:${var.region}:123073262904:product/fortinet/fortigate"
}
