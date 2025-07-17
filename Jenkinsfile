node {

    echo "Git branch name: ${env.BRANCH_NAME}"
    echo "Build number is: ${env.BUILD_NUMBER}"
    echo "Node name is: ${env.NODE_NAME}"

    def mvnHome = tool name: "maven-3.9.9"

    try {

        stage("Git Checkout") {
            git branch: 'dev', url: 'https://github.com/nagireddysubhash/maven_web_app.git'
        }

        stage("Build") {
            sh "${mvnHome}/bin/mvn clean package"
        }

        stage("Sonar Report") {
            sh "${mvnHome}/bin/mvn sonar:sonar"
        }

        stage("Nexus Backup Version") {
            sh "${mvnHome}/bin/mvn deploy"
        }

        stage("Deploy to Container") {
            sh """
                curl -u Subhash_jenkins_server:Pandas@143 \
                --upload-file target/maven-web-application.war \
                "http://13.61.6.218:8080/manager/text/deploy?path=/maven-web-application&update=true"
            """
        }

        currentBuild.result = "SUCCESS"

    } catch (e) {
        currentBuild.result = "FAILURE"
        echo "Build failed: ${e.getMessage()}"
        throw e
    } finally {
        notifyBuild(currentBuild.result)
    }
}

// Notification function
def notifyBuild(String buildStatus = 'STARTED') {
    buildStatus = buildStatus ?: 'SUCCESS'

    def colorCode = '#FF0000'
    def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
    def summary = "${subject} (${env.BUILD_URL})"

    if (buildStatus == 'STARTED') {
        colorCode = '#FFFF00'
    } else if (buildStatus == 'SUCCESS') {
        colorCode = '#00FF00'
    }

    slackSend(color: colorCode, message: summary, channel: '#amazon-dev')
    slackSend(color: colorCode, message: summary, channel: '#amazon-prod')
}
