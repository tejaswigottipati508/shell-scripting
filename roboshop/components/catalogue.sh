#!/bin/bash

COMPONENT=catalogue

source components/common.sh

Print "Installing NodeJS" "yum install nodejs make gcc-c++ -y"
yum install nodejs make gcc-c++ -y
Stat $?

Print "Adding RoboShop Project User" "useradd roboshop"
id roboshop || useradd roboshop
Stat $?

Print "Download Catalogue Component Code" 'curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"'

curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
Stat $?

Print  "Extract Catalogue Component Code" "rm -rf /home/roboshop/catalogue && mkdir -p /home/roboshop/catalogue && cd /home/roboshop && unzip /tmp/catalogue.zip && mv catalogue-main catalogue && rm -rf catalogue-main README.md && cd /home/roboshop/catalogue"
rm -rf /home/roboshop/catalogue && mkdir -p /home/roboshop/catalogue && cd /home/roboshop && unzip /tmp/catalogue.zip && mv catalogue-main catalogue && rm -rf catalogue-main README.md && cd /home/roboshop/catalogue
Stat $?

Print "Install NodeJs Dependencies" "npm install"
npm install --unsafe-perm
Stat $?

# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue
