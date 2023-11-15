echo 'nameserver 192.168.122.1' > /etc/resolv.conf

apt-get update
apt-get install bind9 -y

echo '
zone "riegel.canyon.it08.com" {
	type master;
	file "/etc/bind/jarkom/riegel.canyon.it08.com";
};
zone "granz.channel.it08.com" {
	type master;
	file "/etc/bind/jarkom/granz.channel.it08.com";
};
' > /etc/bind/named.conf.local

mkdir -p /etc/bind/jarkom

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.it08.com. root.riegel.canyon.it08.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      riegel.canyon.it08.com.
@       IN      A       192.237.2.2
www     IN      CNAME   riegel.canyon.it08.com. 
' > /etc/bind/jarkom/riegel.canyon.it08.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     granz.channel.it08.com. root.granz.channel.it08.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      granz.channel.it08.com.
@       IN      A       192.237.2.2
www     IN      CNAME   granz.channel.it08.com.
roundrobin			IN      CNAME   granz.channel.it08.com.
leastconnection		IN      CNAME   granz.channel.it08.com.
iphash				IN      CNAME   granz.channel.it08.com.
generichash			IN      CNAME   granz.channel.it08.com.
' > /etc/bind/jarkom/granz.channel.it08.com

service bind9 restart