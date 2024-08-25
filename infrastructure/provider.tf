terraform {
    backend "s3" {
        bucket  = "flask-app-today"
        key     = "flask-app.tfstate"
        region  = "ap-southeast-1"
        shared_credentials_files = ["\\Users\\khanh\\.aws\\credentials"]
    }
}

provider "aws" {
  region = "ap-southeast-1"
}