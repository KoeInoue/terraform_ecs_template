resource "aws_iam_user" "ecr_deploy_user" {
  name = "ecr-deploy-user"
}

resource "aws_iam_policy" "ecr_deploy" {
  name        = "deploy"
  path        = "/"
  description = "deploy policy"
  policy      = file("iam_policy/iam_ecr_policy.json")
}

resource "aws_iam_user_policy_attachment" "deploy-attach" {
  user       = aws_iam_user.ecr_deploy_user.name
  policy_arn = aws_iam_policy.ecr_deploy.arn
}
