#!/bin/bash

COMPONENT=frontend

source components/common.sh
netstat -tn 2>/dev/null | grep :80 | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | head
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

Print "Remove Old Docs" "cd /usr/share/nginx/html ;rm -rf *"
cd /usr/share/nginx/html
rm -rf *
Stat $?

Print "Extract RoboShop Frontend Docs" "unzip /tmp/frontend.zip"
unzip /tmp/frontend.zip && mv frontend-main/* . && mv static/* . && rm -rf static README.md frontend-main
Stat $?

Print "Setup Nginx Config for RoboShop" "mv localhost.conf /etc/nginx/default.d/roboshop.conf"
mv localhost.conf /etc/nginx/default.d/roboshop.conf
Stat $?


Print "Starting Nginx Service" "systemctl start nginx"
systemctl enable nginx
systemctl restart nginx
Stat $?
