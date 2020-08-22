#
#   
#
terraform init
terraform plan  -out amghouse_terrafrom_plan
terraform apply "amghouse_terrafrom_plan"
terraform show

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
git commit -a -m "Added VPC " 