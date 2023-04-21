[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-scp/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-scp.svg)](https://github.com/boldlink/terraform-aws-scp/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-scp/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-scp/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-scp/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-scp/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-scp/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-scp/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-scp/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-scp/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-scp/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-scp/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-scp/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-scp/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-scp/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-scp/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Terraform module AWS SCP Terraform module

## Description

This module provides a resource to manage an AWS Organizations policy

### Features covered in this module
- Ability to create a variety of organization policies such as `AISERVICES_OPT_OUT_POLICY`, `BACKUP_POLICY`, `SERVICE_CONTROL_POLICY` (SCP), and `TAG_POLICY`

### Why Use this Module
- This module as well as other Boldlink modules are created following AWS best practices as highlighted by checkov scans on the modules. This ensures that resources are deployed in a secure manner and environment.

Examples available [`here`](./examples)

## Usage
*NOTE*: These examples use the latest version of this module
- Run these examples on the `AWS MANAGEMENT ACCOUNT`.

```console
module "minimum_example" {
  source  = "boldlink/scp/aws"
  name    = local.name
  content = local.content
}
```
## Documentation

[AWS Organizations policies Documentation](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies.html)

[Terraform module documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.35.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.63.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_organizations_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content"></a> [content](#input\_content) | The policy content to add to the new policy. For example, if you create a service control policy (SCP), this string must be JSON text that specifies the permissions that admins in attached accounts can delegate to their users, groups, and roles. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | (Optional) A description to assign to the policy | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The friendly name to assign to the policy. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Key-value map of resource tags. | `map(string)` | `{}` | no |
| <a name="input_target_ids"></a> [target\_ids](#input\_target\_ids) | The unique identifier (IDS) of the root, organizational units, or account numbers that you want to attach the policy to. | `list(string)` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | (Optional) The type of policy to create. Valid values are `AISERVICES_OPT_OUT_POLICY`, `BACKUP_POLICY`, `SERVICE_CONTROL_POLICY (SCP)`, and `TAG_POLICY`. Defaults to `SERVICE_CONTROL_POLICY`. | `string` | `"SERVICE_CONTROL_POLICY"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name (ARN) of the policy. |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier (ID) of the policy. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

### Supporting resources:

The example stacks are used by BOLDLink developers to validate the modules by building an actual stack on AWS.

Some of the modules have dependencies on other modules (ex. Ec2 instance depends on the VPC module) so we create them
first and use data sources on the examples to use the stacks.

Any supporting resources will be available on the `tests/supportingResources` and the lifecycle is managed by the `Makefile` targets.

Resources on the `tests/supportingResources` folder are not intended for demo or actual implementation purposes, and can be used for reference.

### Makefile
The makefile contained in this repo is optimized for linux paths and the main purpose is to execute testing for now.
* Create all tests stacks including any supporting resources:
```console
make tests
```
* Clean all tests *except* existing supporting resources:
```console
make clean
```
* Clean supporting resources - this is done separately so you can test your module build/modify/destroy independently.
```console
make cleansupporting
```
* !!!DANGER!!! Clean the state files from examples and test/supportingResources - use with CAUTION!!!
```console
make cleanstatefiles
```


#### BOLDLink-SIG 2022
