variable "cloudwatch_logs_export_bucket" {
  type        = string
  default     = "logs-receiver"
  description = "Bucket to export logs"
}