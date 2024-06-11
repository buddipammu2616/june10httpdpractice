#create a RDS Data Base
resource "aws_db_instance" "maheshDB" {
  allocated_storage = 5
  engine = "mysql"
  instance_class = "db.t2.micro"
  #name = "mydb1"
  username = var.aws_db_username
  password = var.aws_db_password
  skip_final_snapshot = true
}
