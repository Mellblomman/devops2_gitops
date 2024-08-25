pipeline {
    agent any

    triggers {
    pollSCM('* * * * *') // Pollar varje minut
    }

    stages {
        stage('Checkout') {
            steps {
                // Klona din dev-gren
                git branch: 'dev', url: 'https://github.com/Mellblomman/devops2-gitops.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Byggsteget körs...........'
                echo 'Här skulle din byggprocess normalt köras, till exempel: mvn clean install'
            }
        }
    }
}
