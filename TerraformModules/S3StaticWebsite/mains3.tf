#Create a Static website
#create S3 bucket
resource "aws_s3_bucket" "buddipammukushi1" {
  bucket = "buddipammukushi1"
  tags = {
    "Name" = "buddipammukushi1"
  }
}
#Create aws s3 bucket website configuration
resource "aws_s3_bucket_website_configuration" "s3bucketwebsiteconfiguration" {
  bucket = aws_s3_bucket.buddipammukushi1.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
#Create aws s3 bucket versioning
resource "aws_s3_bucket_versioning" "s3bucketversioning" {
  bucket = aws_s3_bucket.buddipammukushi1.id
  versioning_configuration {
    status = "Enabled"
  }
}
#Create S3 bucket ownership Controls
resource "aws_s3_bucket_ownership_controls" "s3bucketownershipcontrols" {
  bucket = aws_s3_bucket.buddipammukushi1.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
#Create s3 bucket public block acces
resource "aws_s3_bucket_public_access_block" "s3bucketpublicacessblock" {
  bucket = aws_s3_bucket.buddipammukushi1.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
#Create s3 bucket ACL
resource "aws_s3_bucket_acl" "s3bucketacl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3bucketownershipcontrols,
    aws_s3_bucket_public_access_block.s3bucketpublicacessblock
  ]
  bucket = aws_s3_bucket.buddipammukushi1.id
  acl    = "public-read"
}
#Create AWS S3 bucket Policy
resource "aws_s3_bucket_policy" "s3bucketpolicy" {
  bucket = aws_s3_bucket.buddipammukushi1.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "PublicReadGetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": [
              "s3:GetObject"
          ],
          "Resource": [
              "arn:aws:s3:::${var.bucket_name}/*"
          ]
      }
  ]
}  
EOF
}


