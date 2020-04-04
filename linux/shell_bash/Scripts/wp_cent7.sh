#!/bin/bash
#script cai dat wordpress tren centos 7
#tao database va user cho wordpress
DIRECTORY=$(cd `dirname $0` && pwd)
create_database(){
    echo -n "MariaDB Host (localhost): "
    read mariahost
    if [ "$mariahost" = "" ]
    then
	mariahost="localhost"
    fi
    echo -n "Nhap ten DB: "
    read mariadb

    echo -n "Nhap ten user quan ly DB: "
    read mariauser

    echo -n "Nhap password cho user: "
    read mariapass

mysql -u root <<EOF
CREATE DATABASE $mariadb;
CREATE USER $mariauser@$mariahost IDENTIFIED BY '$mariapass';
GRANT ALL PRIVILEGES ON $mariadb.* TO $mariauser IDENTIFIED BY '$mariapass';
FLUSH PRIVILEGES;
exit
EOF
}
create_database

#cai goi ho tro php-gd
yum -y install php-gd 
#download wordpress
yum -y install wget
wget https://wordpress.org/latest.tar.gz
#unzip wordpress
tar -zxvf latest.tar.gz
# copy cac file trong thu muc wordpress toi duong dan /var/www/html
cp -Rvf /root/wordpress/* /var/www/html
#den thu muc /var/www/html/
cd /var/www/html
#copy file wp-config.php
cp wp-config-sample.php wp-config.php
#sua file wp-config.php voi cac thong tin da nhap
sed -e “s/database_name_here/$mariadb/g” wp-config.php
sed -e “s/username_here/$mariauser/g” wp-config.php
sed “s/password_here/$mariapass/g” wp-config.php
# phan quyen
chown -R apache:apache /var/www/html/*
chmod -R 755 /var/www/html/*
# mo port cho dich vu web
systemctl retart firewalld
firewall-cmd --permanent --add-port=80/tcp      # mo port http
firewall-cmd --permanent --add-port=443/tcp     # mo port https
firewall-cmd --reload
echo “Da cai xong wordpress”
