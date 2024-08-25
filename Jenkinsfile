pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Klonar ditt repository
                git branch: 'dev', url: 'https://github.com/Mellblomman/devops2-gitops.git'
            }
        }
        stage('Build') {
            steps {
                // Skriv ut ett meddelande istället för att bygga
                echo 'Byggsteget körs.....'
                echo 'Här skulle din byggprocess normalt köras, till exempel: mvn clean install'
            }
        }
    }
}