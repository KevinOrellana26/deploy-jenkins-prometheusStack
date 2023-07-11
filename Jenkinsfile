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
        stage('Install Terraform') {
            steps {
                sh """
                    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
                    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
                    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
                        https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
                        sudo tee /etc/apt/sources.list.d/hashicorp.list
                    sudo apt update
                    sudo apt-get install terraform
                    terraform --version
                sh """
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

