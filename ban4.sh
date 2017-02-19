sudo iptables -I INPUT -s $1 -j DROP
if [ $? -eq 0 ]; then
  echo "IPv4 adress : $1 successfully banned."
else
  echo "ban failed."
fi
