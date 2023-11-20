# 7Menetapkan DNS resolver
echo 'nameserver 192.237.1.3' > /etc/resolv.conf

# Memperbarui paket dan menginstal aplikasi yang diperlukan
apt-get update
apt-get install -y nginx wget unzip lynx htop apache2-utils php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip

# Memulai layanan nginx dan PHP-FPM
service nginx start
service php7.3-fpm start

# Unduh file dari Google Drive, ekstrak, dan atur di tempat yang tepat
wget --no-check-certificate -O '/var/www/granz.channel.it08.com.zip' 'https://drive.google.com/u/0/uc?id=1ViSkRq7SmwZgdK64eRbr5Fm1EGCTPrU1&export=download'
unzip -o /var/www/granz.channel.it08.com.zip -d /var/www/
rm /var/www/granz.channel.it08.com.zip
mv /var/www/modul-3 /var/www/granz.channel.it08.com

# Konfigurasi Nginx untuk situs granz.channel.it08.com
echo 'server {
    listen 80;
    server_name granz.channel.it08.com; # Sesuaikan dengan nama domain yang benar

    root /var/www/granz.channel.it08.com;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.3-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}' > /etc/nginx/sites-available/granz.channel.it08.com

# Aktifkan konfigurasi situs dan hapus konfigurasi default jika ada
ln -s /etc/nginx/sites-available/granz.channel.it08.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

# Restart layanan Nginx untuk menerapkan perubahan konfigurasi
service nginx restart