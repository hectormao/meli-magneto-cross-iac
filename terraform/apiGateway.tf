resource "aws_api_gateway_rest_api" "magneto" {
  name        = "magneto-api-gateway-${var.app_env}"
  description = "API Gateway para validador ADN de Magneto"
}

resource "aws_api_gateway_resource" "magneto" {
  rest_api_id = aws_api_gateway_rest_api.magneto.id
  parent_id   = aws_api_gateway_rest_api.magneto.root_resource_id
  path_part   = "magneto"
}

resource "aws_api_gateway_resource" "api" {
  rest_api_id = aws_api_gateway_rest_api.magneto.id
  parent_id   = aws_api_gateway_resource.magneto.id
  path_part   = "api"
}

resource "aws_api_gateway_resource" "apigateway_version1_resource" {
  rest_api_id = aws_api_gateway_rest_api.magneto.id
  parent_id   = aws_api_gateway_resource.api.id
  path_part   = "v1"
}

resource "aws_api_gateway_api_key" "magneto" {
  name = "magneto-api-key-${var.app_env}"
}

resource "aws_api_gateway_usage_plan" "mutant" {
  name = "magneto-mutant-usage-plan-${var.app_env}"
}

resource "aws_api_gateway_usage_plan_key" "main" {
  key_id        = aws_api_gateway_api_key.magneto.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.mutant.id
}


output "api_key" {
  value = aws_api_gateway_api_key.magneto.value
}

