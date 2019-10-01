locals {

  account_id = "276493936417"

  env       = "dev"
  region    = "ap-southeast-1"
  namespace = "internal"
  name      = "terraform-aws-codebuild"

  id = "${local.env}-${local.region}-${local.namespace}-${local.name}"

  tags = {
    owner = "qpham"
    env   = "dev"
  }
}

#variable "role_arn" {
#  description = "Export your TF_VAR_role_arn to run terraform"
#  type        = string
#}

#variable "external_id" {
#  description = "Export your TF_VAR_external_id to run terraform"
#  type        = string
#  default     = "b28c3f1e-f1d3-442e-b298-76dde32ee034"
#}

provider "aws" {
  version = "2.17.0"
  region  = "ap-southeast-1"
  assume_role {
    role_arn    = "dev-ap-southeast-1-internal-jenkins-operation-iam-role"
  }
}

provider "aws" {
  alias   = "us-east-1"
  region  = "us-east-1"
  #assume_role {
  #  role_arn    = "arn:aws:iam::${local.account_id}:role/${var.role_arn}"
  #  external_id = "${var.external_id}"
  #}
}

#terraform {
#  required_version = "=0.12.8"
#  backend "s3" {

#    bucket         = "terraform-state.archanan.io"
#    key            = "internal/dev/terraform.tfstate"
#    region         = "ap-southeast-1"
#    encrypt        = "true"

    ## This role is just used for CircleCI planning
    ## If you want to apply terraform code, change this to the role having full access on terraform state bucket

    #role_arn       = "arn:aws:iam::276493936417:role/admin"
    #external_id    = "b28c3f1e-f1d3-442e-b298-76dde32ee034"
#  }
#}
