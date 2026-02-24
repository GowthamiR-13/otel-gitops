pipeline {
  agent any

  environment {
    AWS_DEFAULT_REGION = 'us-west-2'
    TF_IN_AUTOMATION = 'true'
  }

  stages {

    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('AWS Identity Check') {
      steps {
        sh 'aws sts get-caller-identity'
      }
    }

    stage('Terraform Format Check') {
      steps {
        dir('infra') {
          sh 'terraform fmt -check -recursive'
        }
      }
    }

    stage('Terraform Init & Validate') {
      steps {
        dir('infra') {
          sh '''
            terraform init -no-color
            terraform validate -no-color
          '''
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        dir('infra') {
          sh '''
            terraform plan -no-color -out=tfplan
            terraform show -no-color tfplan > tfplan.txt
          '''
        }
      }
    }

    stage('Validate Kubernetes Manifests') {
      steps {
        sh '''
          find manifests -type f \\( -name "*.yaml" -o -name "*.yml" \\) -print0 | \
          xargs -0 kubeconform -strict -ignore-missing-schemas
        '''
      }
    }
  }
}
