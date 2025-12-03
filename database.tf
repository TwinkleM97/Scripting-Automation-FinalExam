resource "aws_db_subnet_group" "oracle_subnet_group" {
  name       = "oracle-subnet-group"
  subnet_ids = [aws_subnet.public_a.id, aws_subnet.public_b.id]

  tags = {
    Name = "oracle-subnet-group"
  }
}

resource "aws_db_instance" "oracle" {
  identifier              = "oracle-db"
  engine                  = "mysql"
  engine_version          = "8.0.40"         
  instance_class          = "db.t3.micro"    #using T3 as T2 is not working for some reason
  allocated_storage       = 20
  username                = "elder"
  password                = var.db_password
  db_name                 = "oracledb"
  skip_final_snapshot     = true
  publicly_accessible     = true
  db_subnet_group_name    = aws_db_subnet_group.oracle_subnet_group.name

  tags = {
    Name = "oracle-db-rds"
  }
}
