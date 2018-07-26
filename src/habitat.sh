export HAB_NONINTERACTIVE=true

# restore habitat keys
mkdir -p /hab/cache/keys/
echo "$HAB_SIGN_KEY" > /hab/cache/keys/$HAB_KEYS_NAME.sig.key
echo "$HAB_PUB_KEY" > /hab/cache/keys/$HAB_KEYS_NAME.pub

# create an encrypted archive of the certificates, which will be shipped to the habitat builder
mkdir results
tar -zcv --dereference --directory /etc/letsencrypt/live/$DOMAIN/ fullchain.pem privkey.pem | openssl enc -aes-256-cbc -out results/certs.zip -pass env:ENCRYPT_CERT_SECRET

# install habitat
curl --silent https://raw.githubusercontent.com/habitat-sh/habitat/master/components/hab/install.sh | /bin/ash

# build and upload habitat package
hab pkg build .
hab pkg upload --auth "$HAB_TOKEN" --channel stable results/*.hart
