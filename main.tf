data "aws_kendra_query_suggestions_block_list" "kendra_query_suggestions_block_list_lookup" {
  for_each = var.kendra_query_suggestions_block_list_lookup

  index_id                        = each.value.index_id
  query_suggestions_block_list_id = each.value.query_suggestions_block_list_id
  region                          = each.value.region
  tags                            = each.value.tags
}

