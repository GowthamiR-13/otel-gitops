pipeline {
  agent any
  environment { AWS_DEFAULT_REGION = "us-west-2" }

  stages {
    stage('Checkout') { steps { checkout scm } }

    stage('Terraform Init') {
      steps { dir('infra') { sh 'terraform init' } }
    }

    stage('Terraform Validate') {
      steps { dir('infra') { sh 'terraform validate' } }
    }

    stage('Terraform Plan') {
      steps { dir('infra') { sh 'terraform plan' } }
    }
  }
}
