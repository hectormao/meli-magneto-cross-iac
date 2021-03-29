resource "aws_dynamodb_table" "dna" {
  name           = "dna-${var.app_env}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "dnaString"

  attribute {
    name = "dnaString"
    type = "S"
  }


}

resource "aws_dynamodb_table" "mageto_stats" {
  name           = "magneto-stats-${var.app_env}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "statName"

  attribute {
    name = "statName"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "mutant_stats" {
  table_name = aws_dynamodb_table.mageto_stats.name
  hash_key   = aws_dynamodb_table.mageto_stats.hash_key

  item = <<ITEM
{
  "statName": {"S": "mutant_stats"},
  "countMutantDNA": {"N": "0"},
  "countHumanDNA": {"N": "0"}
}
ITEM
}
