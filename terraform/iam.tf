
data "aws_caller_identity" "current" {}

resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = ["sts.amazonaws.com"]
}

data "aws_iam_policy_document" "github_trust" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type = "Federated"
      identifiers = [
        aws_iam_openid_connect_provider.github.arn
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values   = [var.github_oidc_subject]
    }
  }
}

resource "aws_iam_role" "github_cd" {
  name               = "devops-github-cd"
  assume_role_policy = data.aws_iam_policy_document.github_trust.json
}

data "aws_iam_policy_document" "github_cd" {
  statement {
    actions = ["ssm:SendCommand"]

    resources = [
      "arn:aws:ssm:sa-east-1::document/AWS-RunShellScript",
      "arn:aws:ec2:sa-east-1:${data.aws_caller_identity.current.account_id}:instance/${module.ec2.instance_id}"
    ]
  }

  statement {
    actions = [
      "ssm:GetCommandInvocation"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "github_cd" {
  name   = "deploy-via-ssm"
  role   = aws_iam_role.github_cd.id
  policy = data.aws_iam_policy_document.github_cd.json
}

output "github_cd_role_arn" {
  value = aws_iam_role.github_cd.arn
}
