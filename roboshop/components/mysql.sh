#!/bin/bash

COMPONENT=user

source components/common.sh

Print "Setup MySQL Repo" ""
echo '[mysql57-community]
name=MySQL 5.7 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/7/$basearch/
enabled=1
gpgcheck=0' > /etc/yum.repos.d/mysql.repo
Stat $?

Print "Install MYSQL" "yum remove mariadb-libs -y && yum install mysql-community-server -y"
yum remove mariadb-libs -y && yum install mysql-community-server -y
Stat $?

Print "Start MYSQL Server" "systemctl enable mysqld && systemctl start mysqld"
systemctl enable mysqld
systemctl start mysqld
Stat $?

echo "show databases;" | mysql -uroot -ppassword &>/dev/null
if [ $? -ne 0 ]; then
   Print "Grab Default MYSQL Password" "grep temp /var/log/mysqld.log"
   DEFAULT_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{Print $NF}')
   Stat $?

   Print "Reset MYSQL Password" ""
   mysql --connect-expired-password -uroot -p"${DEFAULT_PASSWORD}" <<EOF
   ALTER USER 'root'@'localhost' IDENTIFIED BY 'Default_RoboShop*999';
   uninstall plugin validate_password;
   ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
EOF
   Stat $?
fi

Print "Download Schema" 'curl -s -L -o /tmp/mysql.zip "https://github.com/roboshop-devops-project/mysql/archive/main.zip"'

curl -s -L -o /tmp/mysql.zip "https://github.com/roboshop-devops-project/mysql/archive/main.zip"
Stat $?

Print "Load Schema" "mysql <shipping.sql"
cd /tmp
unzip -o mysql.zip
cd mysql-main
mysql -uroot -ppassword <shipping.sql
Stat $?