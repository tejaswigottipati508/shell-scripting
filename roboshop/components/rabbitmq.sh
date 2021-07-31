#!/bin/bash

COMPONENT=rabbitmq

source components/common.sh

if [ $? -ne 0 ]; then
  Print "Install ErLang" "yum install https://github.com/rabbitmq/erlang-rpm/releases/download/v23.2.6/erlang-23.2.6-1.el7.x86_64.rpm -y"
  yum install https://github.com/rabbitmq/erlang-rpm/releases/download/v23.2.6/erlang-23.2.6-1.el7.x86_64.rpm -y
  Stat $?
fi

Print "Setup RabbitMQ Repos" "curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
Stat $?

Print "Install RabbitMQ" "yum install rabbitmq-server -y"
yum install rabbitmq-server -y
Stat $?

Print "Start RabbitMQ Service"
systemctl enable rabbitmq-server && systemctl start rabbitmq-server
Stat $?

Print "Create Application User in RabbitMQ" 'rabbitmqctl add_user roboshop roboshop123 && rabbitmqctl set_user_tags roboshop administrator && rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" '
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_user_tags roboshop administrator && rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
Stat $?