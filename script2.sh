#!/bin/bash
  IP_ADDRESS=$2
  HOSTNAME=$1
  SERVER_DNS=$3
  nslookup_ip=$(nslookup $HOSTNAME $SERVER_DNS | grep 'Address:' | tail -n 1 | awk '{print $2}')

  if [ $IP_ADRESS != $nslookup ]; then  
	echo "Serverul ip nu este acelasi cu cel de pe Google." 
  else
	echo "Serverul ip este acelasi cu cel de pe Google."
fi

