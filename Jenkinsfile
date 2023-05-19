pipeline {
agent any
parameters {
    choice(name: 'VERSION', choices; ['1.2.0'], ['1.1.0'], ['1.3.0'], descriptions: '')
    booleanParam (name: 'executesTests', defaultValue: true, descriptions: '')
}
stages{
    
    stage('Check Out') {
      steps {
        git(url: 'https://github.com/kassa16/Jenkin_Tutorial', branch: 'main')
      }
    }

    stage('Build'){
        steps{
        echo 'This is building stage'
    }
    }
    stage ('test'){
        when {
            expression {
                params.executesTests == true
            }
        }
        steps{
echo 'This is staging stage'            
}
}

stage (Deploy){
    steps{
    echo 'This is deploying stage'
    echo "deploying version ${params.VERSION}"
}
}

}