pipeline {
   agent any
     stages{
	    stage('Git Checkout'){
		    steps{
			   git branch: 'testbranch', url: 'https://github.com/sriramarji/adk-test1.git'
			}
			}
		stage('Terraform init check'){
		    steps{
			   sh 'terraform init'
			}
			}
		stage('Terraform plan check'){
		    steps{
			   sh 'terraform plan -var-file="myvars.tfvars"'
			}
			}
		stage('Terraform apply check') {
		    steps{
			   sh 'terraform apply -auto-approve -var-file="myvars.tfvars"'
		    }
		}
	}
}
