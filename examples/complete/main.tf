module "complete_example_scp" {
  source      = "../../"
  name        = "${local.name}-scp"
  content     = local.content
  description = "Service control policy to deny creation of other EC2 instance types apart from T2 Micro"
  target_ids  = [data.aws_organizations_organization.org.non_master_accounts[0].id]
  tags        = local.tags
}

module "complete_example_tag_policy" {
  source      = "../../"
  name        = "${local.name}-tag-policy"
  content     = local.tag_policy
  type        = "TAG_POLICY"
  description = "Tag policy to enforce standardization of \"costcenter\" and \"Team\" tag keys and their allowed values"
  target_ids  = [data.aws_organizations_organization.org.non_master_accounts[0].id]
  tags        = local.tags
}
