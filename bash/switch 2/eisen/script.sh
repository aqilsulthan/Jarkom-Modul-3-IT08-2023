echo 'nameserver 192.168.122.1' > /etc/resolv.conf

apt-get update
apt-get install nginx -y

echo '
# Default menggunakan Round Robin
upstream myweb {
 	server 192.237.3.2;
 	server 192.237.3.3;
 	server 192.237.3.4;
}

upstream mywebroundrobin {
 	server 192.237.3.2;
 	server 192.237.3.3;
 	server 192.237.3.4;
}

upstream mywebleastconnection {
    least_conn;
 	server 192.237.3.2;
 	server 192.237.3.3;
 	server 192.237.3.4;
}

upstream mywebiphash {
    ip_hash;
 	server 192.237.3.2;
 	server 192.237.3.3;
 	server 192.237.3.4;
}


upstream mywebgenerichash {
 	server 192.237.3.2;
 	server 192.237.3.3;
 	server 192.237.3.4;
}

server {
 	listen 80;
 	server_name granz.channel.it08.com;

 	location / {
 	proxy_pass http://myweb;
 	}
}

server {
 	listen 80;
 	server_name roundrobin.granz.channel.it08.com;

 	location / {
 	proxy_pass http://mywebroundrobin;
 	}
}

server {
 	listen 80;
 	server_name leastconnection.granz.channel.it08.com;

 	location / {
 	proxy_pass http://mywebleastconnection;
 	}
}

server {
 	listen 80;
 	server_name iphash.granz.channel.it08.com;

 	location / {
 	proxy_pass http://mywebiphash;
 	}
}

server {
 	listen 80;
 	server_name generichash.granz.channel.it08.com;

 	location / {
 	proxy_pass http://mywebgenerichash;
 	}
}
' > /etc/nginx/sites-available/granz.channel.it08.com

ln -s /etc/nginx/sites-available/granz.channel.it08.com /etc/nginx/sites-enabled
service nginx restart