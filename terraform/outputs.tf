output "api_gateway_invoke_url" {
  description = "Invoke URL of the API Gateway"
  value       = aws_apigatewayv2_api.http_api.api_endpoint
}

output "lambda_function_arn" {
  description = "ARN of the deployed Lambda function"
  value       = aws_lambda_function.lambda_function.arn
}