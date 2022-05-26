# Simple web deployment

- Created an S3 bucket to serve as the remote backend for terraform state file
- Created a vpc with two public and privte subnets
- Created a route table 
- Created an Internet Gateway and linked the IG with the pulic Subent through the route table.
- Created a security group with ingress open to port 22 and port 80 for testing though my ip only.
- Created an instance in the public subnet and used terraform povisioner to provison a written shell script that got a web zip folder, unzipped and moved the folder into the /var/www/html and finially restarted httpd service. 
- Created a public and private key to allow terraform SSH into the instance
- Terraform then produced the public IP Address of the instance as an output after sucessfully provisioning the static-web. 