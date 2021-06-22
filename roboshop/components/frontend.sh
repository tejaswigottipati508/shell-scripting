#!/bin/bash

COMPONENT=frontend

source components/common.sh

Print "Installing Nginx" "yum install nginx -y"
yum install nginx -y

Print "Starting Nginx Service" "systemctl start nginx"
exit
systemctl enable nginx
systemctl start nginx
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-master README.md
Print "Setup Nginx Config for RoboShop"
mv localhost.conf /etc/nginx/default.d/roboshop.conf
systemctl restart nginx
