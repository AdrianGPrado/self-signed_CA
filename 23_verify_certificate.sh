
# Verify the certificate

SERVER_FQDN=www.server1.example.com
FQDN=www.example.com
BASE_DIR=./ca/intermediate

openssl x509 -noout -text \
    -in ${BASE_DIR}/certs/${SERVER_FQDN}.cert.pem

openssl verify -CAfile ${BASE_DIR}/certs/ca-chain.cert.pem \
    ${BASE_DIR}/certs/${FQDN}.cert.pem

