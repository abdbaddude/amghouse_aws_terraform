#
#   
#
terraform init
export TF_VAR_server_port=8080
terraform plan  -out amghouse_terrafrom_plan
terraform apply "amghouse_terrafrom_plan"
terraform show
#test the created single webapp
#APP_PUBLIC_IP=$(terraform output public_ip)
#curl ${APP_PUBLIC_IP}:${TF_VAR_server_port}

#test the created cluster 2-10 webapp servers
export TF_VAR_server_port=80
APP_DNS =$(terraform output alb_dns_name)
curl ${APP_DNS}:${TF_VAR_server_port}

#destroy the AWS infrastructure just built
terraform destroy 

#
#   Push to Repo 
#
cat > README.md <<EOF
# amghouse_aws_terraform
## learning Terraform
EOF
git init
git add README.md main.tf
git status
git commit -m "Initial commit"
git status
cat > .gitignore <<EOF
.terraform
*.tfstate
*.tfstate.backup
EOF
git add .gitignore
git add amghouse_terrafrom_*
git status
git commit -m "Add a .gitignore file"
git status
git remote -v add origin git@github.com:abdbaddude/amghouse_aws_terraform.git
git push -v origin master
# git pull origin master
git diff
git status
git log
git commit -a -m "Added VPC  & Variables " 
git commit -a -m "LB using Application Load Balancer ALB() " 