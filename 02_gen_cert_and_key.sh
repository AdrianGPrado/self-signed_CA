###############################################################################
# 
# Create the root certificate
# 
# Use the root key (ca.key.pem) to create a root certificate (ca.cert.pem). Give
# the root certificate a long expiry date, such as twenty years. Once the root
# certificate expires, all certificates signed by the CA become invalid.
# 
# Warning
# 
# Whenever you use the req tool, you must specify a configuration file to use with
# the -config option, otherwise OpenSSL will default to /etc/pki/tls/openssl.cnf.
# 
###############################################################################

#!/bin/bash

for i in "$@"
do
case $i in
    -n|--name)
    EXTENSION="${i#*=}"
    shift # past argument
    ;;
    --default)
    EXTENSION=www.example.com
    shift # pst argument with no value
    ;;
    *)
esac
done

BASE_DIR=./ca
SSL_CONF=openssl.root.cnf

openssl req -config ${SSL_CONF} \
    -key ${BASE_DIR}/private/ca.key.pem \
    -new -x509 -days 7300 -sha256 -extensions v3_ca \
    -out ${BASE_DIR}/certs/ca.cert.pem

    #-subj "/C=US/ST=Texas/L=Houston/O=Dis/CN=" \

