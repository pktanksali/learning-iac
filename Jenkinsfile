node {
  stage('Get code from SCM') {
    checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/pktanksali/learning-iac.git']]]
  }
  stage('Create Amazon AMI') {
    sh 'packer build -var "aws_access_key=${ACCESS_KEY}" -var "aws_secret_key=${SECRET_KEY}" raddit-base-image.json'   
    env.AMI_ID = sh ( script: 'cat "${WORKSPACE}/manifest.json" | jq -r ".builds[-1].artifact_id" | cut -d":" -f2', returnStdout: true).trim()
    sh "echo ${AMI_ID}"
  }
  stage('Launch EC2 Instance') {
    sh "cd \${WORKSPACE}/terraform; terraform init -input=false; terraform apply -input=false -auto-approve -var \"access_key=\${ACCESS_KEY}\" -var \"secret_key=\${SECRET_KEY}\" -var \"ami_id=\${AMI_ID}\""
    env.PUBLIC_IP = sh ( script: 'cd "${WORKSPACE}/terraform"; terraform output raddit_public_ip', returnStdout: true).trim()
    sh "echo ${PUBLIC_IP}"
  }
  stage('Deploy application on EC2 Instance') {
    sh "cd \${WORKSPACE}/ansible; ansible-playbook -c local ./generate_hosts.yml"
    ansiColor('xterm') {
      ansiblePlaybook inventory: './ansible/hosts.yml', playbook: './ansible/main.yml', colorized: true
    }
  }
  stage('Testing the Application') {
    input('QA Approval...')
  } 
  stage('Cleanup') {
    cleanWs()
  }
}
