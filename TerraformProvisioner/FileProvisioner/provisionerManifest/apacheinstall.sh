#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start
sudo systemctl enabled httpd
echo "<h1> Hi mahesh </h1>"