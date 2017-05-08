RESULT=`echo $1 | egrep " ([0-9]{1,3}\.){3}[0-9]{1,3}" | wc -l`
RESULT6=`echo $1 | egrep "(::[A-Fa-f0-9])|((:[A-Fa-f0-9]{1,4}){2,})" | wc -l`

if [ $RESULT -eq "1" ]; then
     iptables -i INPUT -s $1 -j DROP
     ERRCODE=$?
     if [ $? -eq 0 ]; then
        echo "New iptables (ipv4) rule for address $1 created"
     else
         echo "ipv4 address detected but failed creating a new rule for iptables"
     fi
elif  [ $RESULT6 -eq "1" ]; then
     ip6tables -I INPUT -s $1 -j DROP
     ERRCODE=$?
      if [ $? -eq 0 ]; then
        echo "New ip6tables (ipv6) rule for address $1 created"
     else
         echo "ipv6 address detected but failed creating a new rule for iptables"
     fi
else
     echo "Invalid format for specified IP adress."
fi
exit $ERRCODE
