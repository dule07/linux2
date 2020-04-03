#!/bin/bash
#script cai dat wordpress tren centos 7
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
exit;
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
#den thu muc wordpress
cd wordpress
#copy file wp-config.php
cp wp-config-sample.php wp-config.php
#sua file wp-config.php voi cac thong tin da nhap
sed -e “s/database_name_here/$dbname/g” wp-config.php
sed -e “s/username_here/$dbuser/g” wp-config.php
sed “s/password_here/$dbpass/g” wp-config.php
# copy cac file trong thu muc wordpress toi duong dan /var/www/html
cp -Rvf /root/wordpress/* /var/www/html
# phan quyen
chown -R apache:apache /var/www/html/*
chmod -R 755 /var/www/html/*
# mo port cho dich vu web
systemctl retart firewall 
firewall-cmd --permanent --add-port=80/tcp      # mo port http
firewall-cmd --permanent --add-port=443/tcp     # mo port https
firewall-cmd --reload
echo “Da cai xong wordpress”
