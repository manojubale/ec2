#!/bin/bash

sudo apt update -y
sudo apt install nginx -y

sudo systemctl start nginx
sudo systemctl enable nginx

# Create a custom HTML page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Manoj DevOps Project</title>
    <style>
        body {
            background-color: #0f172a;
            color: white;
            text-align: center;
            font-family: Arial;
            padding-top: 100px;
        }
        h1 {
            font-size: 50px;
            color: #38bdf8;
        }
    </style>
</head>
<body>
    <h1>🚀 Welcome Manoj!</h1>
    <p>Jenkins + Terraform + AWS EC2 + NGINX Working ✅</p>
</body>
</html>
EOF