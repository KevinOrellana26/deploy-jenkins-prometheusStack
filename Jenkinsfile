pipeline {
    agent any
    stages {
        stage('Check Repository') { //Verificamos si la configuración necesaria para el despliegue se encuentra en este repositorio.
            steps {
                git 'https://github.com/KevinOrellana26/deploy-jenkins-prometheusStack.git'
            }
        }
        stage('Create namespace') {
            steps {
                sh "terraform init"
                sh "terraform plan"
                sh "terrafom apply -auto-approve"
            }
        }

        stage('Deploy Prometheus on cluster from script'){ //Una vez comprobado, lo desplegamos. Desplegamos una aplicación a la vez.
            steps {
                echo 'Deploy Prometheus on Kubernetes'
                //sh './prometheus/deployPrometheus.sh' //Puedo crear un script que levante el Prometheus
                sh "terraform init"
                sh "terraform plan"
                sh "terrafom apply -auto-approve"
            }
        }
        stage('Deploy Alertmanager on cluster from script'){
            steps {
                echo 'Deploy Alertmanager on Kubernetes'
                //sh './alertmanager/deployAlert.sh'
                sh "terraform init"
                sh "terraform plan"
                sh "terrafom apply -auto-approve"
            }
        }
        stage('Deploy Grafana on cluster from script'){
            steps {
                echo 'Deploy Grafana on Kubernetes'
                //sh './grafana/deployGrafana.sh'
                sh "terraform init"
                sh "terraform plan"
                sh "terrafom apply -auto-approve"
            }
        }
        stage('Deploy Jenkins on cluster from script'){
            steps {
                echo 'Deploy Jenkins on Kubernetes'
                //sh './jenkins/deployJenkins.sh'
                sh "terraform init"
                sh "terraform plan"
                sh "terrafom apply -auto-approve"
            }
        }
    }
}
