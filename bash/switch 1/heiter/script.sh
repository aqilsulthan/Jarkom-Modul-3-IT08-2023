echo nameserver 192.168.122.1 > /etc/resolv.conf

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

zone "1.237.192.in-addr.arpa" {
        type master;
        file "/etc/bind/jarkom/1.237.192.in-addr.arpa";
};

' > /etc/bind/named.conf.local

mkdir /etc/bind/jarkom
rm /etc/bind/jarkom/riegel.canyon.it08.com
cp /etc/bind/db.local /etc/bind/jarkom/riegel.canyon.it08.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.it08.com. root.riegel.canyon.it08.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      riegel.canyon.it08.com.
@       IN      A       192.237.2.3     ; IP Eisen
www     IN      CNAME   riegel.canyon.it08.com.' > /etc/bind/jarkom/riegel.canyon.it08.com

rm /etc/bind/jarkom/granz.channel.it08.com
cp /etc/bind/db.local /etc/bind/jarkom/granz.channel.it08.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     granz.channel.it08.com. root.granz.channel.it08.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      granz.channel.it08.com.
@       IN      A       192.237.2.3   ; IP Eisen
www     IN      CNAME   granz.channel.it08.com.' > /etc/bind/jarkom/granz.channel.it08.com

rm /etc/bind/jarkom/1.237.192.in-addr.arpa
cp /etc/bind/db.local /etc/bind/jarkom/1.237.192.in-addr.arpa

echo '
 ;
 ; BIND data file for local loopback interface
 ;
 $TTL    604800
 @       IN      SOA     riegel.canyon.it08.com. root.riegel.canyon.it08.com. (
 				2023101001; Serial
 				604800    ; Refresh
 				86400     ; Retry
 				2419200   ; Expire
 				604800 )  ; Negative Cache TTL
 ;
 1.237.192.in-addr.arpa.         IN      NS      riegel.canyon.it08.com.
 2                               IN      PTR     riegel.canyon.it08.com.' > /etc/bind/jarkom/1.237.192.in-addr.arpa

 echo 'options {
      directory "/var/cache/bind";

      forwarders {
              192.168.122.1;
      };

      // dnssec-validation auto;
      allow-query{any;};
      auth-nxdomain no;    # conform to RFC1035
      listen-on-v6 { any; };
}; ' >/etc/bind/named.conf.options

service bind9 restart