#!/bin/bash

# json2zabbix


json_auth='{"jsonrpc":"2.0","method":"user.login","params":{"user":"admin","password":"zabbix"},"id":1}'
rpc_url='http://127.0.0.1/zabbix/api_jsonrpc.php'


ZABBIX_TOKEN=`curl -s -XGET -H "Content-Type:application/json-rpc" \
		-d $json_auth $rpc_url | jq -r '.result'`

#echo "####### TOKEN = $ZABBIX_TOKEN"

if [ $1 ]; then
  json=`cat $1 | jq '.' -c |  sed -e s/##TOKEN##/$ZABBIX_TOKEN/ `
  curl -s -XGET -H "Content-Type:application/json-rpc" \
		-d $json $rpc_url 
else
  echo "JSON to ZABBIX Request"
  echo "Usage: json2zabbix.sh <filename>"
fi

