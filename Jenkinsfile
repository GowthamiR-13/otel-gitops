pipeline {
  agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: terraform
    image: hashicorp/terraform:1.6.6
    command:
    - cat
    tty: true
"""
      defaultContainer 'terraform'
    }
  }

  environment {
    AWS_DEFAULT_REGION = "us-west-2"
  }

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Terraform Init') {
      steps {
        dir('infra') {
          sh 'terraform version'
          sh 'terraform init'
        }
      }
    }

    stage('Terraform Validate') {
      steps {
        dir('infra') {
          sh 'terraform validate'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        dir('infra') {
          sh 'terraform plan'
        }
      }
    }
  }
}
