#create a RDS Data Base
resource "aws_db_instance" "db1" {
  allocated_storage = 5
  engine = "mysql"
  engine_version = "8.0.35"
  instance_class = "db.t2.micro"
  #name = "mydb1"
  username = var.aws_db_username
  password = var.aws_db_password
  skip_final_snapshot = true
}
