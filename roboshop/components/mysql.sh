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

Print "Grab Default MYSQL Password" "grep temp /var/log/mysqld.log"
DEFAULT_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{Print $NF}')
Stat $?

echo DEFAULT_PASSWORD = $DEFAULT_PASSWORD

Print "Reset MYSQL Password" ""
mysql --connect-expired-password -uroot -p"${DEFAULT_PASSWORD}" <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Default_RoboShop*999';
uninstall plugin validate_password;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
EOF
Stat $?
