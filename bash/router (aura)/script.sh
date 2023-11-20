#.bashrc
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.237.0.0/16

apt-get update
apt-get install isc-dhcp-relay -y

echo '
SERVERS="192.237.1.2"
INTERFACES="eth1 eth2 eth3 eth4"
OPTIONS=' > /etc/default/isc-dhcp-relay

echo 'net.ipv4.ip_forward=1' > /etc/sysctl.conf

# TESTING ->
service isc-dhcp-relay start
service isc-dhcp-relay restart