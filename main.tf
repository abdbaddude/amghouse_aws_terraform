provider "aws" {
  region = "us-east-2"
  #shared_credentials_file = "/Users/abdurrahmanadebiyi/.aws/credentials"
  profile                 = "amghousecorp"
}

resource "aws_instance" "example" {
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}
