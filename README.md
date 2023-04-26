# terraform-aws-neptune

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-neptune/workflows/Verify/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-neptune)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-neptune.svg)](https://github.com/JamesWoolfenden/terraform-aws-neptune/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-neptune.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-neptune/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-neptune/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-neptune&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-neptune/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-neptune&benchmark=INFRASTRUCTURE+SECURITY)

Terraform module -

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

This is just a very basic example.

```cli
$ checkov -d . --external-checks-dir checkov/
...
```

![alt text](./diagram/neptune.png)

Include **module.neptune.tf** this repository as a module in your existing terraform code:

```terraform
module "neptune" {
  source        = "JamesWoolfenden/neptune/aws"
  version       = "v0.2.1"
  common_tags   = var.common_tags
  subnet_ids    = [element(tolist(data.aws_subnet_ids.private.ids), 0)]
  cluster       = local.config
  allowed_range = module.ip.cidr
}
```

This example uses a different config sourcing mechanism, the contents of a yml file - config.yaml are read into a local map block local.config.

In the example _config.yml_ you'll see 2 properties

```json
vpc_name_tag: "TEST"
sub_tag: "Public"
```

These properties are used by _data.network.tf_ to find your VPC and Subnet,
Im expecting a tag of "Type" to be equal to the value of the sub_tags parameter for the subnets (I tag type:private and type:public)

```terraform
  filter {
    name   = "tag:Type"
    values = [local.config["sub_tag"]]
  }
```

The VPC is found by it's name tag:

```terraform
  filter {
    name   = "tag:Name"
    values = [local.config["vpc_name_tag"]]
  }
```

Switch tags and values for whatever your VPC and Subnet are tagged.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.64.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.NeptunePrimaryCpuAlarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.NeptunePrimaryGremlinRequestsPerSecAlarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.NeptunePrimaryMemoryAlarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.NeptunePrimarySparqlRequestsPerSecAlarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_iam_policy.NeptuneCloudWatchPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.NeptuneS3Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.NeptuneRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_neptune_cluster.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_cluster) | resource |
| [aws_neptune_cluster_instance.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_cluster_instance) | resource |
| [aws_neptune_cluster_parameter_group.NeptuneDBClusterParameterGroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_cluster_parameter_group) | resource |
| [aws_neptune_parameter_group.examplea](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_parameter_group) | resource |
| [aws_neptune_subnet_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_subnet_group) | resource |
| [aws_security_group.neptune](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_sns_topic.NeptuneAlarmTopic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.NeptuneAlarmSubscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AppName"></a> [AppName](#input\_AppName) | Please specify the Application Name. Used for tagging and resource names. Mandatory LOWER CASE. | `string` | `"appname"` | no |
| <a name="input_Env"></a> [Env](#input\_Env) | Please specify the target Environment. Used for tagging and resource names. Mandatory LOWER CASE. | `string` | `"dev"` | no |
| <a name="input_GremlinRequestsPerSecThreshold"></a> [GremlinRequestsPerSecThreshold](#input\_GremlinRequestsPerSecThreshold) | Gremlin Requests Per Sec alarm threshold. Alert when Gremlin Requests Per Sec goes above this value. In percentage used | `number` | `10000` | no |
| <a name="input_HighCpuAlarmThreshold"></a> [HighCpuAlarmThreshold](#input\_HighCpuAlarmThreshold) | High CPU alarm threshold. Alert when CPU goes above this value.  In percentage used | `number` | `80` | no |
| <a name="input_LowMemoryAlarmThreshold"></a> [LowMemoryAlarmThreshold](#input\_LowMemoryAlarmThreshold) | Low memory alarm threshold. Alert when memory falls below this value.  In bytes | `number` | `7e-8` | no |
| <a name="input_NeptuneDBClusterPreferredMaintenanceWindow"></a> [NeptuneDBClusterPreferredMaintenanceWindow](#input\_NeptuneDBClusterPreferredMaintenanceWindow) | Neptune DB cluster preferred maintenance window. Format - ddd:hh24:mi-ddd:hh24:mi. Valid Days - Mon, Tue, Wed, Thu, Fri, Sat, Sun. Constraints - Minimum 30-minute window. | `string` | `"mon:03:00-mon:04:00"` | no |
| <a name="input_NeptuneDBInstancePreferredMaintenanceWindow"></a> [NeptuneDBInstancePreferredMaintenanceWindow](#input\_NeptuneDBInstancePreferredMaintenanceWindow) | Neptune DB instance preferred maintenance window. Format - ddd:hh24:mi-ddd:hh24:mi. Valid Days - Mon, Tue, Wed, Thu, Fri, Sat, Sun. Constraints - Minimum 30-minute window. | `string` | `"mon:03:00-mon:04:00"` | no |
| <a name="input_NeptuneDBSubnetGroupName"></a> [NeptuneDBSubnetGroupName](#input\_NeptuneDBSubnetGroupName) | The name for the DB Subnet Group. This value is stored as a lowercase string. Constraints, Must contain no more than 255 letters, numbers, periods, underscores, spaces, or hyphens. Must not be default. | `string` | `"sato-neptune"` | no |
| <a name="input_NeptuneEnableAuditLog"></a> [NeptuneEnableAuditLog](#input\_NeptuneEnableAuditLog) | Neptune DB parameters. Allowed values 0, 1 | `number` | `0` | no |
| <a name="input_NeptuneQueryTimeout"></a> [NeptuneQueryTimeout](#input\_NeptuneQueryTimeout) | Neptune DB parameters. Allowed values 10-2147483647 | `number` | `120000` | no |
| <a name="input_Region"></a> [Region](#input\_Region) | n/a | `string` | `"eu-west-2"` | no |
| <a name="input_SNSEmailSubscription"></a> [SNSEmailSubscription](#input\_SNSEmailSubscription) | SNS Email subscription. Optional. If not provided, no alarm subscriptions will be created | `string` | n/a | yes |
| <a name="input_SparqlRequestsPerSecThreshold"></a> [SparqlRequestsPerSecThreshold](#input\_SparqlRequestsPerSecThreshold) | Sparql Requests Per Sec alarm threshold. Alert when Sparql Requests Per Sec goes above this value. In percentage used | `number` | `10000` | no |
| <a name="input_Version"></a> [Version](#input\_Version) | Please specify the Application Version. Used for tagging | `string` | `"1"` | no |
| <a name="input_allowed_range"></a> [allowed\_range](#input\_allowed\_range) | Cidrs that are allowed into Neptune | `list(any)` | n/a | yes |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Neptune Cluster data | `map(any)` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | This is to help you add tags to your cloud objects | `map(any)` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | n/a | `bool` | `true` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | n/a | `string` | `"1.2.0.1"` | no |
| <a name="input_family"></a> [family](#input\_family) | Neptune family | `string` | `"neptune1.2"` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | (optional) describe your variable | `string` | `"example-a"` | no |
| <a name="input_instance"></a> [instance](#input\_instance) | n/a | `map(any)` | <pre>{<br>  "apply_immediately": true,<br>  "engine": "neptune",<br>  "instance_class": "db.t3.medium"<br>}</pre> | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | n/a | `string` | n/a | yes |
| <a name="input_neptune_enable_audit_log"></a> [neptune\_enable\_audit\_log](#input\_neptune\_enable\_audit\_log) | n/a | `number` | `0` | no |
| <a name="input_port"></a> [port](#input\_port) | Port used to connect to the Neptune cluster. Must be a valid port number between | `number` | `8182` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of security group Group Names if using EC2-Classic, or Group IDs if using a VPC | `list(any)` | `[]` | no |
| <a name="input_stack"></a> [stack](#input\_stack) | n/a | `string` | `"tf-module"` | no |
| <a name="input_subnet_group_name"></a> [subnet\_group\_name](#input\_subnet\_group\_name) | n/a | `string` | `"main"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | n/a | `list(any)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Security Group needs to know where to ne made | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | n/a |
| <a name="output_instances"></a> [instances](#output\_instances) | n/a |
| <a name="output_role"></a> [role](#output\_role) | n/a |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Policy

This is the policy required to build this project:

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang
resource "aws_iam_policy" "terraform_pike" {
  name_prefix = "terraform_pike"
  path        = "/"
  description = "Pike Autogenerated policy from IAC"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "SNS:CreateTopic",
                "SNS:DeleteTopic",
                "SNS:GetTopicAttributes",
                "SNS:ListTagsForResource",
                "SNS:SetTopicAttributes"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "cloudwatch:DeleteAlarms",
                "cloudwatch:DescribeAlarms",
                "cloudwatch:ListTagsForResource",
                "cloudwatch:PutMetricAlarm",
                "cloudwatch:TagResource",
                "cloudwatch:UnTagResource"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "ec2:AuthorizeSecurityGroupEgress",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:CreateSecurityGroup",
                "ec2:CreateTags",
                "ec2:DeleteSecurityGroup",
                "ec2:DeleteTags",
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeSecurityGroups",
                "ec2:RevokeSecurityGroupEgress",
                "ec2:RevokeSecurityGroupIngress"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Allow",
            "Action": [
                "iam:AttachRolePolicy",
                "iam:CreatePolicy",
                "iam:CreateRole",
                "iam:DeletePolicy",
                "iam:DeleteRole",
                "iam:DeleteRolePolicy",
                "iam:DetachRolePolicy",
                "iam:GetPolicy",
                "iam:GetPolicyVersion",
                "iam:GetRole",
                "iam:GetRolePolicy",
                "iam:ListAttachedRolePolicies",
                "iam:ListInstanceProfilesForRole",
                "iam:ListPolicyVersions",
                "iam:ListRolePolicies",
                "iam:PassRole",
                "iam:PutRolePolicy"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor4",
            "Effect": "Allow",
            "Action": [
                "rds:AddRoleToDBCluster",
                "rds:AddTagsToResource",
                "rds:CreateDBCluster",
                "rds:CreateDBClusterParameterGroup",
                "rds:CreateDBInstance",
                "rds:CreateDBParameterGroup",
                "rds:CreateDBSubnetGroup",
                "rds:DeleteDBCluster",
                "rds:DeleteDBClusterParameterGroup",
                "rds:DeleteDBInstance",
                "rds:DeleteDBParameterGroup",
                "rds:DeleteDBSubnetGroup",
                "rds:DescribeDBClusterParameterGroups",
                "rds:DescribeDBClusterParameters",
                "rds:DescribeDBClusters",
                "rds:DescribeDBInstances",
                "rds:DescribeDBParameterGroups",
                "rds:DescribeDBParameters",
                "rds:DescribeDBSubnetGroups",
                "rds:ListTagsForResource",
                "rds:ModifyDBCluster",
                "rds:ModifyDBClusterParameterGroup",
                "rds:ModifyDBInstance",
                "rds:ModifyDBParameterGroup",
                "rds:RemoveTagsFromResource"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
})
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-s3](https://github.com/jameswoolfenden/terraform-aws-s3) - S3 buckets

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-neptune/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-neptune/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2023 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
