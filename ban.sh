sudo ip6tables -I INPUT -s $1 -j DROP
echo "IPv6 adress : $1 successfully banned."
