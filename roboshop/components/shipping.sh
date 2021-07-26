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

Print "Extract Shipping Code" "unzip /tmp/shipping.zip && mv shipping-main shipping && cd shipping"
unzip /tmp/shipping.zip && mv shipping-main shipping && cd shipping
Stat $?

Print "Maven Compile Code" "mvn clean package && mv target/shipping-1.0.jar shipping.jar"
mvn clean package && mv target/shipping-1.0.jar shipping.jar
Stat $?
