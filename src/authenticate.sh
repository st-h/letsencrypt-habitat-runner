CHALLENGE_HOST="_acme-challenge"

echo "setting validation host: $CHALLENGE_HOST answer: $CERTBOT_VALIDATION for domain: $CERTBOT_DOMAIN"

# add challenge to dns
RECORD_ID=$(curl -u "$DNS_USER:$DNS_TOKEN" -X POST --silent --data '{"type":"TXT","host":"'"$CHALLENGE_HOST"'","answer":"'"$CERTBOT_VALIDATION"'","ttl":300}' -s "https://api.name.com/v4/domains/$DOMAIN/records" | python -c "import sys,json;print(json.load(sys.stdin)['id'])")

echo "dns record id: $RECORD_ID"

# Sleep to make sure the change has time to propagate over to DNS
sleep 25

# Save info for cleanup
if [ ! -d /tmp/CERTBOT_$CERTBOT_DOMAIN ];then
  mkdir -m 0700 /tmp/CERTBOT_$CERTBOT_DOMAIN
fi
echo $RECORD_ID > /tmp/CERTBOT_$CERTBOT_DOMAIN/RECORD_ID
