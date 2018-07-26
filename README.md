# gitlab habitat letsencrypt

This project manages letsencrypt wildcard certificates via certbot which is run by a gitlab ci runner. If a certificate is issued or renewed, it will be encrypted and uploaded to the habitat builder. Certbot is configured to use the dns challenge using the name.com api. There are no plans to add additional apis as it should be quite easy to fork and adapt DNS related commands to different apis.

# gitlab variables

The following variables need to be set up as gitlab secret variables:

| varible | description |
|-|-|
|ACME_EMAIL| email address used to issue the certs|
|HAB_PUB_KEY| Habitat public key content e.g. from ~/.hab/cache/keys/*.pub (this will be a mutli-line string)|
|HAB_SIGN_KEY| Habitat priv key content e.g. from ~/.hab/cache/keys/*.sig.key (this will be a mutli-line string)|
|HAB_KEYS_NAME| name of the habitat keys (what * would expand to in previous two variables: org-timestamp)|
|HAB_TOKEN| Habitat access token|
|HAB_ORIGIN| Habitat origin name|
|DNS_USER| auth user for dns provider|
|DNS_TOKEN| auth token/pass for dns provider|
|DOMAIN| domain name e.g.: example.test|
|GITLAB_ACCESS_TOKEN| Gitlab personal access token (read_registry is sufficient)|
|ENCRYPT_CERT_SECRET| An arbitrary string used to encrypt the private key and cert|
|ENCRYPT_ARTIFACT_SECRET| An arbitrary string used to encrypt the config directory|

## further information

a brief description of this project and additional details can be found [here](https://forums.habitat.sh/t/doing-things-the-hard-way-using-gitlab-habitat-and-chef-to-automatically-issue-letsencrypt-certificates/724)
