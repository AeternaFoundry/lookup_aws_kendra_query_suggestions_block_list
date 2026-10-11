variable "kendra_query_suggestions_block_list_lookup" {
  description = <<EOT
Map of kendra_query_suggestions_block_list_lookup, attributes below
Required:
    - index_id
    - query_suggestions_block_list_id
Optional:
    - region
    - tags
EOT

  type = map(object({
    index_id                        = string
    query_suggestions_block_list_id = string
    region                          = optional(string)
    tags                            = optional(map(string))
  }))
  validation {
    condition = alltrue([
      for k, v in var.kendra_query_suggestions_block_list_lookup : (
        can(regex("[0-9A-Za-z][0-9A-Za-z-]{35}", v.index_id))
      )
    ])
    error_message = "Starts with an alphanumeric character. Subsequently, can contain alphanumeric characters and hyphens. Fixed length of 36."
  }
  validation {
    condition = alltrue([
      for k, v in var.kendra_query_suggestions_block_list_lookup : (
        can(regex("[0-9A-Za-z][0-9A-Za-z-]{35}", v.query_suggestions_block_list_id))
      )
    ])
    error_message = "Starts with an alphanumeric character. Subsequently, can contain alphanumeric characters and hyphens. Fixed length of 36."
  }
}

