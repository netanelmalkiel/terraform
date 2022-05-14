pipeline {
    agent any
    
    stages {
        stage(build){
            steps {
                withAWS(credentials: 'natimalkiel', region: 'us-west-2') {
                echo "creating bucket..."
                sh 'aws s3api create-bucket --bucket tmstate1 --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2'
                }
            }
        }
        stage(init) {
            steps {
                withAWS(credentials: 'natimalkiel', region: 'us-west-2') {
                echo "initilazing.."      
                sh 'terraform init'
                }
            }
        } 

        stage(apply) {
            steps {
                withAWS(credentials: 'natimalkiel', region: 'us-west-2') {
                echo "applying...."
                sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
