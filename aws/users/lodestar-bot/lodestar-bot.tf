resource "aws_iam_user" "lodestar_bot" {
  name = "lodestar-bot"
  path = "/"
}

resource "aws_iam_access_key" "lodestar_bot_access_key" {
  user    = aws_iam_user.lodestar_bot.name
  pgp_key = filebase64("../keys/lodestar-bot-binary.gpg")
  status  = "Active"
}


resource "aws_iam_user_policy" "lodestar_bot_policy" {
  name = "lodestar-bot-policy"
  user = aws_iam_user.lodestar_bot.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "kms:ListKeys",
      "kms:ListAliases",
      "kms:Decrypt",
      "kms:DescribeKey",
      "kms:Encrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*"

    ],
    "Resource": "*"
  }
}
EOF
}