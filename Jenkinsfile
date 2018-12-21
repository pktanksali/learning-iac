node {
  stage('Get code from SCM') {
    checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/pktanksali/learning-iac.git']]]
  }
  stage('Create AMI') {
    sh 'pwd; ls -l raddit'    
  }
  stage('Three') {
    echo "Hello"
  }
  stage('Four') {
    echo "Running the unit test..."
  }
}
