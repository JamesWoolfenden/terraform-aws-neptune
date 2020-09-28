# terraform-aws-neptune

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-neptune/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-neptune)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-neptune.svg)](https://github.com/JamesWoolfenden/terraform-aws-neptune/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

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

Include **module.activemq.tf** this repository as a module in your existing terraform code:

```terraform
module "activemq" {
  source      = "JamesWoolfenden/neptune/aws"
  version     = "0.0.1"
  common_tags = var.common_tags
  subnet_ids  = [element(tolist(data.aws_subnet_ids.private.ids), 0)]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| aws  | n/a     |

## Inputs

| Name              | Description                                        | Type     | Default                                                                                                                       | Required |
| ----------------- | -------------------------------------------------- | -------- | ----------------------------------------------------------------------------------------------------------------------------- | :------: |
| cluster           | Neptune Cluster data                               | `map`    | n/a                                                                                                                           |   yes    |
| common_tags       | This is to help you add tags to your cloud objects | `map`    | n/a                                                                                                                           |   yes    |
| instance          | n/a                                                | `map`    | <pre>{<br> "apply_immediately": true,<br> "count": 2,<br> "engine": "neptune",<br> "instance_class": "db.r4.large"<br>}</pre> |    no    |
| subnet_group_name | n/a                                                | `string` | `"main"`                                                                                                                      |    no    |
| subnet_ids        | n/a                                                | `list`   | n/a                                                                                                                           |   yes    |

## Outputs

| Name      | Description |
| --------- | ----------- |
| cluster   | n/a         |
| instances | n/a         |
| subnet    | n/a         |

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

Copyright © 2019-2020 James Woolfenden

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
