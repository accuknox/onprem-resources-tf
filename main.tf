# Kubernetes provider
# https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster#optional-configure-terraform-kubernetes-provider
# To learn how to schedule deployments and services using the provider, go here: https://learn.hashicorp.com/terraform/kubernetes/deploy-nginx-kubernetes
# The Kubernetes provider is included in this file so the EKS module can complete successfully. Otherwise, it throws an error when creating `kubernetes_config_map.aws_auth`.
# You should **not** schedule deployments and services in this workspace. This keeps workspaces modular (one for provision EKS, another for scheduling Kubernetes resources) as per best practices.


provider "aws" {
  region                      = var.region
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    acm                      = "http://localhost:443"
    apigateway               = "http://localhost:443"
    cloudformation           = "http://localhost:443"
    cloudwatch               = "http://localhost:443"
    config                   = "http://localhost:443"
    dynamodb                 = "http://localhost:443"
    dynamodbstreams          = "http://localhost:443"
    ec2                      = "http://localhost:443"
    es                       = "http://localhost:443"
    events                   = "http://localhost:443"
    firehose                 = "http://localhost:443"
    iam                      = "http://localhost:443"
    kinesis                  = "http://localhost:443"
    kms                      = "http://localhost:443"
    lambda                   = "http://localhost:443"
    logs                     = "http://localhost:443"
    opensearch               = "http://localhost:443"
    redshift                 = "http://localhost:443"
    resourcegroups           = "http://localhost:443"
    resourcegroupstaggingapi = "http://localhost:443"
    route53                  = "http://localhost:443"
    route53resolver          = "http://localhost:443"
    s3                       = "http://localhost:443"
    s3control                = "http://localhost:443"
    secretsmanager           = "http://localhost:443"
    ses                      = "http://localhost:443"
    sns                      = "http://localhost:443"
    sqs                      = "http://localhost:443"
    ssm                      = "http://localhost:443"
    stepfunctions            = "http://localhost:443"
    sts                      = "http://localhost:443"
    support                  = "http://localhost:443"
    swf                      = "http://localhost:443"
    transcribe               = "http://localhost:443"
    amplify                  = "http://localhost:443"
    apigatewaymanagementapi  = "http://localhost:443"
    apigatewayv2             = "http://localhost:443"
    appconfig                = "http://localhost:443"
    applicationautoscaling   = "http://localhost:443"
    appsync                  = "http://localhost:443"
    athena                   = "http://localhost:443"
    autoscaling              = "http://localhost:443"
    #azure                    = "http://localhost:443"
    backup             = "http://localhost:443"
    batch              = "http://localhost:443"
    ce                 = "http://localhost:443"
    cloudfront         = "http://localhost:443"
    cloudtrail         = "http://localhost:443"
    codecommit         = "http://localhost:443"
    cognitoidentity    = "http://localhost:443"
    cognitoidp         = "http://localhost:443"
    docdb              = "http://localhost:443"
    ecr                = "http://localhost:443"
    ecs                = "http://localhost:443"
    efs                = "http://localhost:443"
    eks                = "http://localhost:443"
    elasticache        = "http://localhost:443"
    elasticbeanstalk   = "http://localhost:443"
    elb                = "http://localhost:443"
    elbv2              = "http://localhost:443"
    emr                = "http://localhost:443"
    fis                = "http://localhost:443"
    glacier            = "http://localhost:443"
    glue               = "http://localhost:443"
    iotdata            = "http://localhost:443"
    iot                = "http://localhost:443"
    iotanalytics       = "http://localhost:443"
    iotwireless        = "http://localhost:443"
    kafka              = "http://localhost:443"
    kinesisanalytics   = "http://localhost:443"
    kinesisanalyticsv2 = "http://localhost:443"
    lakeformation      = "http://localhost:443"
    mediastoredata     = "http://localhost:443"
    mediastore         = "http://localhost:443"
    mq                 = "http://localhost:443"
    mwaa               = "http://localhost:443"
    neptune            = "http://localhost:443"
    organizations      = "http://localhost:443"
    qldbsession        = "http://localhost:443"
    qldb               = "http://localhost:443"
    rdsdata            = "http://localhost:443"
    rds                = "http://localhost:443"
    redshiftdata       = "http://localhost:443"
    sagemakerruntime   = "http://localhost:443"
    sagemaker          = "http://localhost:443"
    serverlessrepo     = "http://localhost:443"
    servicediscovery   = "http://localhost:443"
    sesv2              = "http://localhost:443"
    timestreamquery    = "http://localhost:443"
    timestreamwrite    = "http://localhost:443"
    transfer           = "http://localhost:443"
    xray               = "http://localhost:443"
  }
}




data "aws_availability_zones" "available" {}

locals {
  cluster_name = var.cluster_name
}
