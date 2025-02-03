resource "aws_rds_cluster" "this" {
  cluster_identifier    = var.cluster_identifier
  engine                = var.engine
  engine_version        = var.engine_version
  database_name         = var.database_name

  #
  master_username                       = var.master_username
  manage_master_user_password           = var.manage_master_user_password
  iam_database_authentication_enabled   = var.iam_database_authentication_enabled

  #
  db_subnet_group_name              = 
  db_cluster_parameter_group_name   =

  #
  engine_mode       = "provisioned"
  serverlessv2_scaling_configuration {
    max_capacity    = var.srv2_max_capacity
    min_capacity    = var.srv2_min_capacity
  }

  #
  vpc_security_group_ids    = local.vpc_security_group_ids
  enable_http_endpoint      = var.enable_http_endpoint

  #
  storage_encrypted = true
  kms_key_id = aws_kms_key.this.arn

  #
  backup_retention_period       = var.backup_retention_period
  preferred_backup_window       = var.preferred_backup_window
  preferred_maintenance_window  = var.preferred_maintenance_window

  #
  apply_immediately   = var.apply_immediately
  skip_final_snapshot = var.skip_final_snapshot
  deletion_protection = var.deletion_protection

  #
  tags                  = var.tags
  copy_tags_to_snapshot = var.copy_tags_to_snapshot

  #
  depends_on = [ local.dependecies ]

}

