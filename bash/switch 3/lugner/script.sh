ip a
echo 'nameserver 192.237.1.3' > /etc/resolv.conf
apt-get update
apt-get install nginx -y
apt-get install wget -y
apt-get install unzip -y
apt-get install lynx -y
apt-get install htop -y
apt-get install apache2-utils -y
apt-get install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip -y

service nginx start
service php7.3-fpm start

curl -sSLo granz.channel.yyy.com.zip https://drive.google.com/u/0/uc?id=1ViSkRq7SmwZgdK64eRbr5Fm1EGCTPrU1&export=download
unzip granz.channel.yyy.com.zip
mv modul-3 /var/www/riegel.canyon.it08.com

echo '
server {

listen 80;

root /var/www/riegel.canyon.it08.com;

index index.php index.html index.htm;
server_name _;

location / {
        try_files $uri $uri/ /index.php?$query_string;
}

# pass PHP scripts to FastCGI server
location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
}

location ~ /\.ht {
        deny all;
}

error_log /var/log/nginx/riegel.canyon.it08.com_error.log;
access_log /var/log/nginx/riegel.canyon.it08.com_access.log;
}
' > /etc/nginx/sites-available/granz.channel.it08.com

ln -s /etc/nginx/sites-available/granz.channel.it08.com /etc/nginx/sites-enabled
rm /etc/nginx/sites-enabled/default
service php7.3-fpm start
service nginx restart