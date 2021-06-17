#!/bin/bash

COMPONENT=frontend

source components/common.sh

Print "Installing Nginx" "yum install nginx -y"
yum install nginx -y
Stat $?

Print "Starting Nginx Service" "systemctl start nginx"
systemctl enable nginx
systemctl start nginx
Stat $?

Print "Downloading Frontend Content" 'curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"'

curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
Stat $?

cd /usr/share/nginx/html
rm -rf *
Stat $?
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-master README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
systemctl restart nginx

