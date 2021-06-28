#!/bin/bash

COMPONENT=cart

source components/common.sh

Print "Installing NodeJS" "yum install nodejs make gcc-c++ -y"
yum install nodejs make gcc-c++ -y
Stat $?

Print "Adding RoboShop Project User" "useradd roboshop"
id roboshop || useradd roboshop
Stat $?

Print "Download Cart Component Code" 'curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip"'

curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip"
Stat $?

Print  "Extract Cart Component Code"  "cd /home/roboshop && unzip /tmp/cart.zip && mv cart-main cart && cd cart"
cd /home/roboshop && unzip /tmp/cart.zip && mv cart-main cart && cd cart
Stat $?

Print "Install NODEJS Dependencies" "npm install"
npm install --unsafe-perm
Stat $?

# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue