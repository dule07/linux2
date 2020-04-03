#!/bin/bash
#update
yum -y update
yum -y upgrade
# cai dat Apache
yum -y install httpd
# khoi dong apache
systemctl start httpd
systemctl enable httpd
# mo port cho dich vu web
firewall-cmd --permanent --add-port=80/tcp      # mo port http
firewall-cmd --permanent --add-port=443/tcp     # mo port https
firewall-cmd --reload
# cai dat mariadb
yum -y update
yum -y install mariadb mariadb-server
# khoi dong mariadb
systemctl start mariadb
systemctl enable mariadb
# cai dat repo php
yum install -y epel-release yum-utils
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
# cai dat php
yum-config-manager --enable remi-php74
yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd

#khoi dong lai apache
systemctl restart httpd
echo "ban nen chay lenh `mysql_secure_installation` de cau hinh co ban database"

#cai dat wordpress

#nhap ten database, user, pass cho wp
echo “Hay nhap Database Name: ”
read -e dbname
echo “Hay nhap Database User: ”
read -e dbuser
echo “Hay nhap Database Password: ”
read -s dbpass
#tao database va user/pass cho wordpress
mysql -u root <<EOF
CREATE DATABASE $dbname;



CREATE USER $dbuser@localhost IDENTIFIED BY '$dbpass';



GRANT ALL PRIVILEGES ON $dbname.* TO $mariauser IDENTIFIED BY '$dbpass';
FLUSH PRIVILEGES;
exit;
EOF
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
echo “Da cai xong wordpress”
