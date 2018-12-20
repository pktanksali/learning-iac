node {
  stage('One') {
    echo 'Hi, this is Zulaikha from edureka'
  }
  stage('Two') {
    input('Do you want to proceed?')
  }
  stage('Three') {
    when {
      not {
        branch "master"
      }
    }
    echo "Hello"
  }
  stage('Four') {
    parallel { 
      stage('Unit Test') {
        echo "Running the unit test..."
      }
    }
  }
}
