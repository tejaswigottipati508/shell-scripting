#!/bin/bash

COMPONENT=frontend

source components/common.sh

Print "Installing Nginx" "yum install nginx -y"
yum install nginx -y
Stat $?

Print "Downloading Frontend Content" 'curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"'

curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
Stat $?

Print "Remove Old Docs" "cd /usr/share/nginx/html ;rm -rf *"
cd /usr/share/nginx/html
rm -rf *
Stat $?

Print "Extract Roboshop Frontend Docs" "unzip /tmp/frontend.zip"
unzip /tmp/frontend.zip && mv frontend-main/* . && mv static/* . && rm -rf frontend-master README.md
Stat $?

Print "Setup Nginx Config for Roboshop" "mv localhost.conf /etc/nginx/default.d/roboshop.conf"
Stat $?

Print "Starting Nginx Service" "systemctl start nginx"
systemctl enable nginx
systemctl restart nginx
Stat $?
