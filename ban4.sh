sudo iptables -I INPUT -s $1 -j DROP
echo "IPv4 adress : $1 successfully banned."
