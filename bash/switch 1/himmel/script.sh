echo 'nameserver 192.168.122.1' > /etc/resolv.conf

apt-get update
apt-get install -y isc-dhcp-server
dhcpd --version

echo 'INTERFACES="eth0"' > /etc/default/isc-dhcp-server

echo '
ddns-update-style none;
option domain-name "example.org";
option domain-name-servers ns1.example.org, ns2.example.org;

default-lease-time 600;
max-lease-time 7200;

authoritative;
log-facility local7;

# eth1
subnet 192.237.1.0 netmask 255.255.255.0 {
  option routers 192.237.1.1;
}

# eth2
subnet 192.237.2.0 netmask 255.255.255.0 {
  option routers 192.237.2.1;
}

# eth3
subnet 192.237.3.0 netmask 255.255.255.0 {
    range 192.237.3.16 192.237.3.32;
    range 192.237.3.64 192.237.3.80;
    option routers 192.237.3.1;
    option broadcast-address 192.237.3.255;
    option domain-name-servers 192.237.1.3;
    default-lease-time 180;
    max-lease-time 5760;
}

# eth4
subnet 192.237.4.0 netmask 255.255.255.0 {
    range 192.237.4.12 192.237.4.20;
    range 192.237.4.160 192.237.4.168;
    option routers 192.237.4.1;
    option broadcast-address 192.237.4.255;
    option domain-name-servers 192.237.1.3;
    default-lease-time 720;
    max-lease-time 5760;
}
' > /etc/dhcp/dhcpd.conf
service isc-dhcp-server restart
service isc-dhcp-server status
