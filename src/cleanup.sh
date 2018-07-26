# Cleanup DNS
if [ -f /tmp/CERTBOT_$CERTBOT_DOMAIN/RECORD_ID ]; then
  RECORD_ID=$(cat /tmp/CERTBOT_$CERTBOT_DOMAIN/RECORD_ID)
  echo "removing validation record with id: $RECORD_ID from dns: $DOMAIN"
  rm -f /tmp/CERTBOT_$CERTBOT_DOMAIN/RECORD_ID
  curl -u "$DNS_USER:$DNS_TOKEN" -X DELETE --silent https://api.name.com/v4/domains/$DOMAIN/records/$RECORD_ID
fi
