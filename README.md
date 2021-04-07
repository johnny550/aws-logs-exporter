# terraform-aws-log-exporter

# REFERENCE
The DNX Labs
[![Lint Status](https://github.com/DNXLabs/terraform-aws-log-exporter/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-log-exporter/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-log-exporter)](https://github.com/DNXLabs/terraform-aws-log-exporter/blob/master/LICENSE)

This module creates a lambda function that exports log groups on the AWS account and region deployed(default every 4 hours).

It will only export each log group if it has the tag `ExportToS3=true`, if the last export was more than 24 hours ago it creates an export task to the `S3_BUCKET` defined saving the current timestamp in a SSM parameter.

This module creates:
 - A lambda function
 - A bucket to receive the logs
 - A Cloudwatch to export the logs

# Set a tag {ExportToS3:true} to a Cloudwatch log group
aws --region <AWS REGION> logs tag-log-group --log-group-name <my/log/group/name> --tags ExportToS3=true