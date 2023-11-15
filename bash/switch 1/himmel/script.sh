echo 'nameserver 192.168.122.1' > /etc/resolv.conf

apt-get update
apt-get install -y isc-dhcp-server
dhcpd --version

echo '
INTERFACESv4="eth0"
INTERFACESv6=""
' > /etc/default/isc-dhcp-server

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

# Switch 3
host Lugner {
    hardware ethernet 96:b9:d8:27:a2:19;
    fixed-address 192.237.3.2;
}

host Linie {
    hardware ethernet 0a:0c:ac:a9:91:72;
    fixed-address 192.237.3.3;
}

host Lawine {
    hardware ethernet da:9c:24:00:8c:22;
    fixed-address 192.237.3.4;
}

# Switch 4
host Fern {
    hardware ethernet 46:f1:40:fe:f7:64;
    fixed-address 192.237.4.2;
}

host Flamme {
    hardware ethernet 1a:ab:97:62:57:60;
    fixed-address 192.237.4.3;
}

host Frieren {
    hardware ethernet 02:be:17:c2:21:ed;
    fixed-address 192.237.4.4;
}
' > /etc/dhcp/dhcpd.conf
service isc-dhcp-server restart
service isc-dhcp-server status
