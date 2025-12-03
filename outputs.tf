output "db_connection_string" {
  value = format("admin:%s@%s:%s/%s",
    var.db_password,
    aws_db_instance.oracle.address,
    aws_db_instance.oracle.port,
    aws_db_instance.oracle.db_name
  )
  sensitive = true
}
