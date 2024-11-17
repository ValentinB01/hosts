#!/bin/bash

HOSTS_FILE="/etc/hosts"

if [[ ! -f "$HOSTS_FILE" ]]; then
  echo "The file $HOSTS_FILE does not exist."
  exit 1
fi

while read -r line; do

  if [[ -z "$line" || "$line" =~ ^# ]]; then
    continue
  fi
  
  IP_ADDRESS=$(echo "$line" | awk '{print $1}')
  HOSTNAME=$(echo "$line" | awk '{print $2}')
  
  if [[ -z "$HOSTNAME" ]]; then
    continue
  fi

  echo "Verifying $HOSTNAME with IP $IP_ADDRESS..."
  nslookup "$HOSTNAME" | grep -q "Address" && echo "IP Address for $HOSTNAME is correct." || echo "IP Address for $HOSTNAME is incorrect or nslookup failed."

done < "$HOSTS_FILE"

echo "Script completed."
