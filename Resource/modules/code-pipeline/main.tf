resource "aws_codepipeline" "pipeline" {
  name     = var.name
  role_arn = aws_iam_role.pipeline_role.arn

  artifact_store {
    type     = "S3"
    location = var.artifact_store_bucket
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        Owner      = var.source.owner
        Repo       = var.source.repo
        Branch     = var.source.branch
        OAuthToken = var.source.oauth_token
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name             = "Deploy"
      category         = "Deploy"
      owner            = "AWS"
      provider         = "CodeDeploy"
      version          = "1"
      input_artifacts  = ["source_output"]

      configuration = {
        ApplicationName     = var.deploy_application_name
        DeploymentGroupName = var.deploy_group_name
      }
    }
  }
}

resource "aws_iam_role" "pipeline_role" {
  name = "${var.name}-codepipeline-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "pipeline_policy" {
  role       = aws_iam_role.pipeline_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodePipelineFullAccess"
}
