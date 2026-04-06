#!/bin/bash
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo "<h1>fullsatack-dev-app</h1>" > /var/www/html/index.html