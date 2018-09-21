resource "aws_cloudwatch_metric_alarm" "cluster_status_red" {
  alarm_name          = "${var.cluster_status_red_alarm_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "${var.cluster_status_red_evaluation_periods}"
  metric_name         = "ClusterStatus.red"
  namespace           = "AWS/ES"
  period              = "${var.cluster_status_red_period}"
  statistic           = "Maximum"
  threshold           = "${var.cluster_status_red_threshold}"
  alarm_description   = "At least one primary shard and its replicas are not allocated to a node"
  alarm_action        = ["${var.alarm_action}"]
  ok_action           = ["${var.ok_action}"]
}

resource "aws_cloudwatch_metric_alarm" "cluster_status_yellow" {
  alarm_name          = "${var.cluster_status_yellow_alarm_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "${var.cluster_status_yellow_evaluation_periods}"
  metric_name         = "ClusterStatus.yellow"
  namespace           = "AWS/ES"
  period              = "${var.cluster_status_yellow_period}"
  statistic           = "Maximum"
  threshold           = "${var.cluster_status_yellow_threshold}"
  alarm_description   = "At least one replica shard is not allocated to a node"
  alarm_action        = ["${var.alarm_action}"]
  ok_action           = ["${var.ok_action}"]
}

resource "aws_cloudwatch_metric_alarm" "low_storage_space" {
  alarm_name          = "${var.low_storage_space_name}"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/ES"
  period              = "60"
  statistic           = "Minimum"
  threshold           = "${var.es_ebs_volume_size * 256}"
  alarm_description   = "Less than 25% of ${var.es_ebs_volume_size} storage space available"
  alarm_action        = ["${var.alarm_action}"]
  ok_action           = ["${var.ok_action}"]
}

resource "aws_cloudwatch_metric_alarm" "cluster_index_writes_blocked" {
  alarm_name          = "${var.cluster_index_writes_blocked_alarm_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "${var.cluster_index_writes_blocked_evaluation_periods}"
  metric_name         = "ClusterIndexWritesBlocked"
  namespace           = "AWS/ES"
  period              = "${var.cluster_index_writes_blocked_period}"
  threshold           = "${var.cluster_index_writes_blocked_threshold}"
  alarm_description   = "Cluster is blocking write request due to lack of available storage space or memory"
  alarm_action        = ["${var.alarm_action}"]
  ok_action           = ["${var.ok_action}"]
}

resource "aws_cloudwatch_metric_alarm" "node_unreachable" {
  alarm_name          = "${var.node_unreachable_alarm_name}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "${var.node_unreachable_evaluation_periods}"
  metric_name         = "Nodes"
  namespace           = "AWS/ES"
  period              = "${var.node_unreachable_period}"
  statistic           = "Minimum"
  threshold           = "${var.es_instance_count}"
  alarm_description   = "Node in your cluster has been unreachable for one day."
  alarm_action        = ["${var.alarm_action}"]
  ok_action           = ["${var.ok_action}"]
}

resource "aws_cloudwatch_metric_alarm" "snapshot_failed" {
  alarm_name          = "${var.snapshot_failed_alarm_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "${var.snapshot_failed_evaluation_periods}"
  metric_name         = "AutomatedSnapshotFailure"
  namespace           = "AWS/ES"
  period              = "${var.snapshot_failed_period}"
  statistic           = "Maximum"
  threshold           = "${var.snapshot_failed_threshold}"
  alarm_description   = "An automated snapshot failed"
  alarm_action        = ["${var.alarm_action}"]
  ok_action           = ["${var.ok_action}"]
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_utilization_data_node" {
  alarm_name          = "${var.high_cpu_utilization_data_node_alarm_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "${var.high_cpu_utilization_data_node_evaluation_periods}"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ES"
  period              = "${var.high_cpu_utilization_data_node_period}"
  statistic           = "Average"
  threshold           = "${var.high_cpu_utilization_master_node_threshold}"
  alarm_description   = "High cpu utilization for 15mins"
  alarm_action        = ["${var.alarm_action}"]
  ok_action           = ["${var.ok_action}"]
}

resource "aws_cloudwatch_metric_alarm" "high_jvm_memory_utilization_data_node" {
  alarm_name          = "${var.high_jvm_memory_utilization_data_node_alarm_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "${var.high_jvm_memory_utilization_data_node_evaluation_periods}"
  metric_name         = "JVMMemoryPressure"
  namespace           = "AWS/ES"
  period              = "${var.high_jvm_memory_utilization_data_node_period}"
  statistic           = "Maximum"
  threshold           = "${var.high_jvm_memory_utilization_data_node_threshold}"
  alarm_description   = "High JVM memory utilization for 15mins"
  alarm_action        = ["${var.alarm_action}"]
  ok_action           = ["${var.ok_action}"]
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_utilization_master_node" {
  alarm_name          = "${var.high_cpu_utilization_master_node_alarm_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "${var.high_cpu_utilization_master_node_evaluation_periods}"
  metric_name         = "MasterCPUUtilization"
  namespace           = "AWS/ES"
  period              = "${var.high_cpu_utilization_master_node_period}"
  statistic           = "Average"
  threshold           = "${var.high_cpu_utilization_master_node_threshold}"
  alarm_description   = "High cpu utilization for master node"
  alarm_action        = ["${var.alarm_action}"]
  ok_action           = ["${var.ok_action}"]
}

resource "aws_cloudwatch_metric_alarm" "high_jvm_memory_utilization_master_node" {
  alarm_name          = "${var.high_jvm_memory_utilization_master_node_alarm_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "${var.high_jvm_memory_utilization_master_node_evaluation_periods}"
  metric_name         = "MasterJVMMemoryPressure"
  namespace           = "AWS/ES"
  period              = "${var.high_jvm_memory_utilization_master_node_period}"
  statistic           = "Maximum"
  threshold           = "${var.high_jvm_memory_utilization_master_node_threshold}"
  alarm_description   = "High JVM memory utilization for 15mins"
  alarm_action        = ["${var.alarm_action}"]
  ok_action           = ["${var.ok_action}"]
}

resource "aws_cloudwatch_metric_alarm" "KMS_key_error" {
  alarm_name          = "${var.KMS_key_error_alarm_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "${var.KMS_key_error_alarm_name}"
  metric_name         = "KMSKeyError"
  namespace           = "AWS/ES"
  period              = "${var.KMS_key_error_period}"
  threshold           = "${var.KMS_key_error_threshold}"
  alarm_description   = "The KMS encryption key that is used to encrypt data at rest in your domain is disabled"
  alarm_action        = ["${var.alarm_action}"]
  ok_action           = ["${var.ok_action}"]
}

resource "aws_cloudwatch_metric_alarm" "KMS_key_inaccessible" {
  alarm_name          = "${var.KMS_key_inaccessible_alarm_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "${var.KMS_key_inaccessible_evaluation_periods}"
  metric_name         = "KMSKeyInaccessible"
  namespace           = "AWS/ES"
  period              = "${var.KMS_key_inaccessible_period}"
  threshold           = "${KMS_key_inaccessible_threshold}"
  alarm_description   = "The KMS encryption key has been deleted or has revoked its grants to Amazon ES"
  alarm_action        = ["${var.alarm_action}"]
  ok_action           = ["${var.ok_action}"]
}
