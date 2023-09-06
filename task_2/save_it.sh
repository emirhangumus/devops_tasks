my_ip=$(curl -s ifconfig.me)

echo $my_ip

response=$(curl -s "http://ip-api.com/json/$my_ip")

echo $response | jq

echo $response > output.json
