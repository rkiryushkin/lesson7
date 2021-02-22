resource "aws_s3_bucket" "rkiryushkinterraform" {
  bucket = "rkiryushkinterraform"
  acl    = "private"

  tags = {
    Name        = "rkiryushkinterraform"
    Environment = "itea"
  }
}