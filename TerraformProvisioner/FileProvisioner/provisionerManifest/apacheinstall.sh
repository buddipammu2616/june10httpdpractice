# trunk-ignore-all(shfmt)
#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start
sudo systemctl enable httpd
echo "<h1>Himahesh</h1>"