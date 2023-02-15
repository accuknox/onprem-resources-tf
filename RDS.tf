resource "aws_db_instance" "RDS" {
  allocated_storage    = var.db_storage
  identifier           = var.db_identifier
  engine_version       = var.db_engine_version
  db_subnet_group_name = var.db_subnet_group_name
  engine               = var.db_engine
  instance_class       = var.db_instance_class
  multi_az             = var.db_multi_az
  db_name              = var.db_name
  username             = var.db_username
  password             = random_string.divy_db.result
  storage_type         = var.db_storage_type
  skip_final_snapshot  = true
}