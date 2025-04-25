#!/bin/bash

mkdir /etc/nginx/ssl;

# create ssk key
openssl req -x509 -newkey rsa:4096 -keyout $TLS_KEY_PATH -out $TLS_CERT_PATH -days 365 -nodes -subj "/C=KR/ST=Seoul/L=Seoul/O=42seoul/OU=inception/CN=juhyelee@42.fr";

nginx -g "daemon off;"