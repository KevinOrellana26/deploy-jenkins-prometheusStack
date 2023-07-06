pipeline {
    agent any
    stages {
        stage('Check Repository') { //verificamos que los ficheros esten en el repositorio
            steps {
                git 'https://github.com/KevinOrellana26/deploy-jenkins-prometheusStack.git'
            }
        }
        stage('Create namespace') { //creamos el namespace
            steps {
                sh "terraform init"
                sh "terraform plan"
                sh "terraform apply -auto-approve"
            }
        }

        stage('Deploy Prometheus on cluster from script') { //creamos prometheus
            steps {
                echo 'Deploy Prometheus on Kubernetes'
                sh './prometheus/deployPrometheus.sh'
                // sh "terraform init"
                // sh "terraform plan"
                // sh "terraform apply -auto-approve"
            }
        }
        stage('Deploy Alertmanager on cluster from script') {
            steps {
                echo 'Deploy Alertmanager on Kubernetes'
                sh './alertmanager/deployAlert.sh'
                // sh "terraform init"
                // sh "terraform plan"
                // sh "terraform apply -auto-approve"
            }
        }
        stage('Deploy Grafana on cluster from script') {
            steps {
                echo 'Deploy Grafana on Kubernetes'
                sh './grafana/deployGrafana.sh'
                // sh "terraform init"
                // sh "terraform plan"
                // sh "terraform apply -auto-approve"
            }
        }
        stage('Deploy Jenkins on cluster from script') {
            steps {
                echo 'Deploy Jenkins on Kubernetes'
                sh './jenkins/deployJenkins.sh'
                // sh "terraform init"
                // sh "terraform plan"
                // sh "terraform apply -auto-approve"
            }
        }
    }
}

