#!/bin/bash

COMPONENT=payment

source components/common.sh

Print "Install Python3" "yum install python36 gcc python3-devel -y"
yum install python36 gcc python3-devel -y
Stat $?

Print "Create RoboShop User" "id roboshop || useradd roboshop"
id roboshop || useradd roboshop
Stat $?

Print "Download Payment Code" 'curl -L -s -o /tmp/payment.zip "https://github.com/roboshop-devops-project/payment/archive/main.zip"'
curl -L -s -o /tmp/payment.zip https://github.com/roboshop-devops-project/payment/archive/main.zip
Stat $?

Print "Extracting Payment Code" "rm -rf /home/roboshop/payment && cd /home/roboshop && unzip /tmp/payment.zip && mv payment-main payment"
rm -rf /home/roboshop/payment && cd /home/roboshop && unzip /tmp/payment.zip && mv payment-main payment
Stat $?

Print "Install Python Dependencies" "cd payment  && pip3 install -r requirements.txt"
cd payment  && pip3 install -r requirements.txt
Stat $?
exit

Update the roboshop user and group id in payment.ini file.

Setup the service
chown roboshop :roboshop /home/roboshop -R

# mv /home/roboshop/payment/systemd.service /etc/systemd/system/payment.service
# systemctl daemon-reload
# systemctl enable payment
# systemctl start payment
