 terraform init
 terraform plan  -out amghouse_terrafrom_plan
 terraform apply "amghouse_terrafrom_plan"
 terraform show

echo "# amghouse_aws_terraform" >> README.md
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