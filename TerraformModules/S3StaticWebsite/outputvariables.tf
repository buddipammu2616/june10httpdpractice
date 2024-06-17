#create a output variables
#Create a output value for s3 bucket name
output "aws_s3_bucket" {
  description = "aws_s3_bucket"
  value = aws_s3_bucket.buddipammukushi1.id
}