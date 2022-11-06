variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}

variable "Env" {
  type        = string
  default     = "dev"
  description = "Please specify the target Environment. Used for tagging and resource names. Mandatory LOWER CASE."
}

variable "HighCpuAlarmThreshold" {
  type        = number
  default     = 80
  description = "High CPU alarm threshold. Alert when CPU goes above this value.  In percentage used"
}

variable "SNSEmailSubscription" {
  type        = string
  description = "SNS Email subscription. Optional. If not provided, no alarm subscriptions will be created"
}

variable "cluster" {
  description = "Neptune Cluster data"
  type        = map(any)
}

variable "AppName" {
  type        = string
  default     = "appname"
  description = "Please specify the Application Name. Used for tagging and resource names. Mandatory LOWER CASE."
}

variable "instance" {
  type = map(any)
  default = {
    engine            = "neptune"
    instance_class    = "db.t3.medium"
    apply_immediately = true
  }
}

variable "NeptuneEnableAuditLog" {
  type        = number
  default     = 0
  description = "Neptune DB parameters. Allowed values 0, 1"
}

variable "SparqlRequestsPerSecThreshold" {
  type        = number
  default     = 10000
  description = "Sparql Requests Per Sec alarm threshold. Alert when Sparql Requests Per Sec goes above this value. In percentage used"
}

variable "subnet_group_name" {
  default = "main"
}

variable "NeptuneDBInstancePreferredMaintenanceWindow" {
  type        = string
  default     = "mon:03:00-mon:04:00"
  description = "Neptune DB instance preferred maintenance window. Format - ddd:hh24:mi-ddd:hh24:mi. Valid Days - Mon, Tue, Wed, Thu, Fri, Sat, Sun. Constraints - Minimum 30-minute window."
}

variable "Version" {
  type        = string
  default     = "1"
  description = "Please specify the Application Version. Used for tagging"
}

variable "GremlinRequestsPerSecThreshold" {
  type        = number
  default     = 10000
  description = "Gremlin Requests Per Sec alarm threshold. Alert when Gremlin Requests Per Sec goes above this value. In percentage used"
}

variable "subnet_ids" {
  type = list(any)
}

variable "NeptuneDBClusterPreferredMaintenanceWindow" {
  type        = string
  default     = "mon:03:00-mon:04:00"
  description = "Neptune DB cluster preferred maintenance window. Format - ddd:hh24:mi-ddd:hh24:mi. Valid Days - Mon, Tue, Wed, Thu, Fri, Sat, Sun. Constraints - Minimum 30-minute window."
}

variable "NeptuneDBSubnetGroupName" {
  type        = string
  default     = "sato-neptune"
  description = "The name for the DB Subnet Group. This value is stored as a lowercase string. Constraints, Must contain no more than 255 letters, numbers, periods, underscores, spaces, or hyphens. Must not be default."
}
variable "vpc_id" {
  type        = string
  description = "Security Group needs to know where to ne made"
}

variable "kms_key_arn" {
  type        = string
  description = ""
}

variable "LowMemoryAlarmThreshold" {
  type        = number
  default     = 0.00000007
  description = "Low memory alarm threshold. Alert when memory falls below this value.  In bytes"
}

variable "NeptuneQueryTimeout" {
  type        = number
  default     = 120000
  description = "Neptune DB parameters. Allowed values 10-2147483647"
}
variable "family" {
  type        = string
  default     = "neptune1.2"
  description = "Neptune family"
}

variable "port" {
  type        = number
  default     = 8182
  description = "Port used to connect to the Neptune cluster. Must be a valid port number between"
}

variable "neptune_enable_audit_log" {
  type    = number
  default = 0
}

variable "Region" {
  type    = string
  default = "eu-west-2"
}

variable "engine_version" {
  default = "1.2.0.1"
}

variable "stack" {
  type    = string
  default = "tf-module"
}

variable "allowed_range" {
  type        = list(any)
  description = "Cidrs that are allowed into Neptune"
}

variable "security_groups" {
  type        = list(any)
  description = "List of security group Group Names if using EC2-Classic, or Group IDs if using a VPC"
  default     = []
}

variable "identifier" {
  type        = string
  default     = "example-a"
  description = "(optional) describe your variable"
}
