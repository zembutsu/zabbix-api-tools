#!/bin/sh

# ZBBIX auth

json='{"jsonrpc":"2.0","method":"user.login","params":{"user":"admin","password":"zabbix"},"id":1}'
curl -s -XGET -H "Content-Type:application/json-rpc" -d $json http://127.0.0.1/zabbix/api_jsonrpc.php 
 


