output "access_key_secret" {
    value = aws_iam_access_key.lodestar_bot_access_key.encrypted_secret
}