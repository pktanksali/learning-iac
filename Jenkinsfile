node {
  stage('Get code from SCM') {
    checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/pktanksali/learning-iac.git']]]
  }
  stage('Create Amazon AMI') {
    sh 'packer build -var "aws_access_key=${ACCESS_KEY}" -var "aws_secret_key=${SECRET_KEY}" raddit-base-image.json'    
  }
  stage('Three') {
    echo "Hello"
  }
  stage('Four') {
    echo "Running the unit test..."
  }
}
