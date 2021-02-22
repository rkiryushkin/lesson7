  resource "aws_db_instance" "lesson7-rds" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  name                 = "lesson7"
  username             = "lesson7"
  password             = "lesson7lesson7"
  skip_final_snapshot  = true
  publicly_accessible  = true
}