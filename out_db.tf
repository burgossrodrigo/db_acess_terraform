# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_db_instance" "porteiro" {
  allocated_storage           = 400
  allow_major_version_upgrade = null
  apply_immediately           = null
  auto_minor_version_upgrade  = true
  # availability_zone           = "us-east-1a"
  backup_retention_period     = 1
  backup_target               = "region"
  backup_window               = "06:21-06:51"
  ca_cert_identifier          = "rds-ca-rsa2048-g1"
  character_set_name          = null
  copy_tags_to_snapshot       = true
  custom_iam_instance_profile = null
  customer_owned_ip_enabled   = false
  db_name                     = null
  db_subnet_group_name        = aws_db_subnet_group.porteiro.name
  dedicated_log_volume        = false
  delete_automated_backups    = true
  deletion_protection         = false
  domain                      = null
  domain_auth_secret_arn      = null
  # domain_dns_ips                        = []
  domain_fqdn                           = null
  domain_iam_role_name                  = null
  domain_ou                             = null
  enabled_cloudwatch_logs_exports       = []
  engine                                = "postgres"
  engine_lifecycle_support              = "open-source-rds-extended-support-disabled"
  engine_version                        = jsonencode(16.1)
  final_snapshot_identifier             = null
  iam_database_authentication_enabled   = false
  identifier                            = "bia"
  identifier_prefix                     = null
  instance_class                        = "db.t3.micro"
  iops                                  = null
  kms_key_id                            = var.db_kms
  license_model                         = "postgresql-license"
  maintenance_window                    = "thu:05:35-thu:06:05"
  manage_master_user_password           = true
  master_user_secret_kms_key_id         = null
  max_allocated_storage                 = 1000
  monitoring_interval                   = 0
  monitoring_role_arn                   = null
  multi_az                              = false
  nchar_character_set_name              = null
  network_type                          = "IPV4"
  option_group_name                     = "default:postgres-16"
  parameter_group_name                  = "default.postgres16"
  password                              = null # sensitive
  performance_insights_enabled          = true
  performance_insights_kms_key_id       = var.db_kms
  performance_insights_retention_period = 7
  port                                  = 5432
  publicly_accessible                   = false
  replica_mode                          = null
  replicate_source_db                   = null
  skip_final_snapshot                   = true
  snapshot_identifier                   = null
  storage_encrypted                     = true
  storage_throughput                    = null
  storage_type                          = "gp2"
  tags                                  = {}
  tags_all                              = {}
  timezone                              = null
  upgrade_storage_config                = null
  username                              = "postgres"
  vpc_security_group_ids = [ aws_security_group.porteiro.id ]
}

resource "aws_db_subnet_group" "porteiro" {
  name = "bia_subnet_group"
  subnet_ids = [var.subnet_id_a, var.subnet_id_b]

  tags = {
    name = "bia_subnet_group"
  }
}
