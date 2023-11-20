echo 'nameserver 192.237.1.3' > /etc/resolv.conf
apt-get update
apt-get install apache2-utils -y
apt-get install nginx -y
apt-get install lynx -y

service nginx start

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo ' upstream granz {
	server 192.237.4.2; # IP Fern
	server 192.237.4.3; # IP Flamme
	server 192.237.4.4; # IP Frieren
}

upstream riegel {
	server 192.237.3.2;	# Lugner
	server 192.237.3.3;	# Linie
	server 192.237.3.4;	# Lawine
}

server {
	listen 80;
	server_name granz.channel.it08.com;

	# Allow only specific IP addresses
	allow 192.237.3.69; 
	allow 192.237.3.70; 
	allow 192.237.4.167;
	allow 192.237.4.168;
	deny all;

	location /its {
		return 301 https://www.its.ac.id/;
	}

	location / {
		auth_basic "Restricted Access";
        auth_basic_user_file /etc/nginx/rahasisakita/.htpasswd;
		proxy_pass http://granz/;
		proxy_set_header    X-Real-IP $remote_addr;
		proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header    Host $http_host;
	}
}

server {
	listen 80;
	server_name riegel.canyon.it08.com;

	# Allow only specific IP addresses
	allow 192.237.3.69; 
	allow 192.237.3.70; 
	allow 192.237.4.167;
	allow 192.237.4.168;
	deny all;

	location /its {
		return 301 https://www.its.ac.id/;
	}

	location / {
		proxy_pass http://riegel/;
		proxy_set_header    X-Real-IP $remote_addr;
		proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header    Host $http_host;
	}
} ' > /etc/nginx/sites-available/lb_php

ln -s /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

service nginx restart