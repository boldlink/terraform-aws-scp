[![Build Status](https://github.com/boldlink/terraform-aws-scp/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/boldlink/terraform-aws-scp/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Terraform module AWS SCP Terraform module

## Description

This module provides a resource to manage an AWS Organizations policy

Examples available [`here`]github.com/boldlink/terraform-aws-scp/tree/main/examples)

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

### Makefile
The makefile contained in this repo is optimized for linux paths and the main purpose is to execute testing for now.
* Create all tests:
`$ make tests`
* Clean all tests:
`$ make clean`

#### BOLDLink-SIG 2022
