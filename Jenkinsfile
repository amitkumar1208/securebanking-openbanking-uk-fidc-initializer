podTemplate(containers: [
    containerTemplate(
        name: 'maven', 
        image: 'maven:3.8.1-jdk-8', 
        command: 'sleep', 
        args: '30d'
        ),
    containerTemplate(
        name: 'python', 
        image: 'python:latest', 
        command: 'sleep', 
        args: '30d')
  ]) {

    node(POD_LABEL) {
        stage('Get a Maven project') {
            git 'https://github.com/TSB-Bank/tsb-env-forgerock.git', branch: 'dev'
            container('maven') {
                stage('Build a Maven project') {
                    sh '''
                    echo "maven build"
                    '''
                }
            }
        }

        stage('Get a Python Project') {
            git url: 'https://github.com/TSB-Bank/tf-env-ob.git', branch: 'dev'
            container('python') {
                stage('Build a Go project') {
                    sh '''
                    echo "Go Build"
                    '''
                }
            }
        }

    }
}
