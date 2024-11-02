variable "name" {
  description = "The name of the CodePipeline"
  type        = string
}

variable "source" {
  description = "Source configuration for the pipeline"
  type = object({
    owner  = string
    repo   = string
    branch = string
    oauth_token = string
  })
}

variable "artifact_store_bucket" {
  description = "S3 bucket for pipeline artifacts"
  type        = string
}

variable "deploy_application_name" {
  description = "Name of the CodeDeploy application"
  type        = string
}

variable "deploy_group_name" {
  description = "Name of the CodeDeploy deployment group"
  type        = string
}
