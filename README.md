# terraform-aws-neptune

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-neptune/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-neptune)
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
  version       = "0.0.1"
  common_tags   = var.common_tags
  subnet_ids    = [element(tolist(data.aws_subnet_ids.private.ids), 0)]
  cluster       = local.config
  allowed_range = module.ip.cidr
}
```

This example uses a different config sourcing mechanism, the contents of a yml file - config.yaml are read into a local map block local.config.

In the example *config.yml* you'll see 2 properties

```json
vpc_name_tag: "TEST"
sub_tag: "Public"
```

These properties are used by *data.network.tf* to find your VPC and Subnet,
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
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_neptune_cluster.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_cluster) | resource |
| [aws_neptune_cluster_instance.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_cluster_instance) | resource |
| [aws_neptune_parameter_group.examplea](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_parameter_group) | resource |
| [aws_neptune_subnet_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_subnet_group) | resource |
| [aws_security_group.neptune](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_range"></a> [allowed\_range](#input\_allowed\_range) | Cidrs that are allowed into Neptune | `list(any)` | n/a | yes |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Neptune Cluster data | `map(any)` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | This is to help you add tags to your cloud objects | `map(any)` | n/a | yes |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | (optional) describe your variable | `string` | `"example-a"` | no |
| <a name="input_instance"></a> [instance](#input\_instance) | n/a | `map(any)` | <pre>{<br>  "apply_immediately": true,<br>  "count": 2,<br>  "engine": "neptune",<br>  "instance_class": "db.r4.large"<br>}</pre> | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | n/a | `string` | n/a | yes |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of security group Group Names if using EC2-Classic, or Group IDs if using a VPC | `list(any)` | `[]` | no |
| <a name="input_subnet_group_name"></a> [subnet\_group\_name](#input\_subnet\_group\_name) | n/a | `string` | `"main"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | n/a | `list(any)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Security Group needs to know where to ne made | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | n/a |
| <a name="output_instances"></a> [instances](#output\_instances) | n/a |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

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

Copyright © 2019-2021 James Woolfenden

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
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-neptune&url=https://github.com/JamesWoolfenden/terraform-aws-neptune
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-neptune&url=https://github.com/JamesWoolfenden/terraform-aws-neptune
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-neptune
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-neptune
[share_email]: mailto:?subject=terraform-aws-neptune&body=https://github.com/JamesWoolfenden/terraform-aws-neptune
