#!/bin/bash

COMPONENT=user

source components/common.sh

Print "Installing Maven" "yum install maven -y"
yum install maven -y
Stat $?

Print "Adding RoboShop Project User" "useradd roboshop"
id roboshop || useradd roboshop
Stat $?

Print "Download Shipping Code" 'curl -s -L -o /tmp/shipping.zip "https://github.com/roboshop-devops-project/shipping/archive/main.zip"'

curl -s -L -o /tmp/shipping.zip "https://github.com/roboshop-devops-project/shipping/archive/main.zip"
Stat $?

Print "Extract Shipping Code" "rm -rf /home/roboshop/shipping && cd /home/roboshop && unzip /tmp/shipping.zip && mv shipping-main shipping && cd shipping"
rm -rf /home/roboshop/shipping && cd /home/roboshop && unzip /tmp/shipping.zip && mv shipping-main shipping && cd shipping
Stat $?

Print "Maven Compile Code" "mvn clean package && mv target/shipping-1.0.jar shipping.jar"
mvn clean package && mv target/shipping-1.0.jar shipping.jar
Stat $?

Print "Update SystemD Script for Shipping" 'sed -i -e "s/CARTENDPOINT/cart-ss.tejadevops.tk/" -e "s/DBHOST/mysql-ss.tejadevops.tk/" /home/roboshop/shipping/systemd.service'
sed -i -e "s/CARTENDPOINT/cart-ss.tejadevops.tk/" -e "s/DBHOST/mysql-ss.tejadevops.tk/" /home/roboshop/shipping/systemd.service
Stat $?

Print "Start Shipping Service" "mv /home/roboshop/shipping/systemd.service /etc/systemd/system/shipping.service && systemctl daemon-reload && systemctl enable shipping && systemctl restart shipping"
mv /home/roboshop/shipping/systemd.service /etc/systemd/system/shipping.service && systemctl daemon-reload && systemctl enable shipping && systemctl restart shipping
Stat $?