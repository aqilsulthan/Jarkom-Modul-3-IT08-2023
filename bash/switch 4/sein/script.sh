ip a

apt update
apt install lynx -y
apt install htop -y
apt install apache2-utils -y
apt-get install jq -y

echo '
# auto eth0
# iface eth0 inet static
#         address 192.243.4.6
#         netmask 255.255.255.0
#         gateway 192.243.4.1


auto eth0
iface eth0 inet dhcp' > /etc/network/interfaces

# restart node

# TESTING ->
cat /etc/resolv.conf
ip a

# POST Register 
echo '
{
  "username": "kelompokit08",
  "password": "passwordit08"
}' > register.json

# POST Login
echo '
{
  "username": "kelompokit08",
  "password": "passwordit08"
}' > register.json

# Get me