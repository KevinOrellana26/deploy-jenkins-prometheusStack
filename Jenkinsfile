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
        stage('Install software') {
            steps{
                script {
                    sh '''
                        apt install -y sudo && \
                        apt install -y curl && \
                        apt install -y wget && \
                        wget --version
                    sh '''
                }
            }
        }
        stage('Install Terraform') {
            steps {
                script {
                    sh '''
                        wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
                        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
                        apt update
                        apt install -y terraform
                        terraform --version
                    sh '''
                }
                // sh 'sudo apt-get update && sudo apt-get install -y gnupg software-properties-common'
                // sh 'wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg'
                // sh 'echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main"'
                // sh 'sudo tee /etc/apt/sources.list.d/hashicorp.list'
                // sh 'sudo apt update'
                // sh 'sudo apt-get install terraform'
                // sh 'terraform --version'
            }
        }
        stage('test'){
            steps {
                sh 'ls -lha'
            }
        }
        stage('Create namespace') { //creamos el namespace
            steps {
                //sh './namespace.sh'
                sh """
                    terraform init
                    terraform plan
                    terraform apply -auto-approve
                sh """
            }
        }

        stage('Deploy Prometheus on cluster from script') { //creamos prometheus
            steps {
                echo 'Deploy Prometheus on Kubernetes'
                // sh './prometheus/deployPrometheus.sh'
                sh """
                    terraform init
                    terraform plan
                    terraform apply -auto-approve
                sh """
            }
        }
        stage('Deploy Alertmanager on cluster from script') {
            steps {
                echo 'Deploy Alertmanager on Kubernetes'
                // sh './alertmanager/deployAlert.sh'
                sh """
                    terraform init
                    terraform plan
                    terraform apply -auto-approve
                sh """
            }
        }
        stage('Deploy Grafana on cluster from script') {
            steps {
                echo 'Deploy Grafana on Kubernetes'
                // sh './grafana/deployGrafana.sh'
                sh """
                    terraform init
                    terraform plan
                    terraform apply -auto-approve
                sh """
            }
        }
        // stage('Deploy Jenkins on cluster from script') {
        //     steps {
        //         echo 'Deploy Jenkins on Kubernetes'
        //         // sh './jenkins/deployJenkins.sh'
        //         sh "terraform init"
        //         sh "terraform plan"
        //         sh "terraform apply -auto-approve"
        //     }
        // }
    }
}

