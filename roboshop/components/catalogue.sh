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

curl -s -L -o /tmp/catalogue.zip https://github.com/roboshop-devops-project/catalogue/archive/main.zip
Stat $?

Print  "Extract Catalogue Component Code"  "cd /home/roboshop && unzip /tmp/catalogue.zip && mv catalogue-main/* ."
cd /home/roboshop && unzip /tmp/catalogue.zip && mv catalogue-main/* . && cd /home/roboshop/catalogue
Stat $?

Print "Intall NODEJS Dependencies" "npm install"
npm install --unsafe-perm
Stat $?

Print "Update SystemD Script for Catalogue" ""
mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue


