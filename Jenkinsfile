pipeline {
    agent {
        label 'agente1'
    }
    stages {
        stage('Check Repository') { //verificamos que los ficheros esten en el repositorio
            steps {
                git branch: 'main', url: 'https://github.com/KevinOrellana26/deploy-jenkins-prometheusStack.git'
            }
        }
        stage('Create namespace') { //creamos el namespace
            steps {
                //sh './namespace.sh'
                sh '''
                    terraform init
                    terraform plan
                    terraform apply -auto-approve
                sh '''
            }
        }

        stage('Deploy Prometheus') { //creamos prometheus
            steps {
                echo 'Deploy Prometheus on Kubernetes'
                // sh './prometheus/deployPrometheus.sh'
                sh '''
                    terraform init
                    terraform plan
                    terraform apply -auto-approve
                sh '''
            }
        }
        stage('Deploy Alertmanager ') {
            steps {
                echo 'Deploy Alertmanager on Kubernetes'
                // sh './alertmanager/deployAlert.sh'
                sh '''
                    terraform init
                    terraform plan
                    terraform apply -auto-approve
                sh '''
            }
        }
        stage('Deploy Grafana') {
            steps {
                echo 'Deploy Grafana on Kubernetes'
                // sh './grafana/deployGrafana.sh'
                sh '''
                    terraform init
                    terraform plan
                    terraform apply -auto-approve
                sh '''
            }
        }
    }
}

