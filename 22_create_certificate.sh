###############################################################################
# Create a certificate
# 
# Use the private key to create a certificate signing request (CSR). The CSR
# details don’t need to match the intermediate CA. For server certificates, the
# Common Name must be a fully qualified domain name (eg, www.example.com), whereas
# for client certificates it can be any unique identifier (eg, an e-mail address).
# Note that the Common Name cannot be the same as either your root or
# intermediate certificate.
###############################################################################


ROOT_DIR=./ca
BASE_DIR=./ca/intermediate

FQDN=www.example2.com

ROOT_OPENSSL_CONF=openssl.root.cnf
BASE_OPENSSL_CONF=openssl.intermediate.cnf

openssl req \
    -config ${BASE_OPENSSL_CONF} \
    -key ${BASE_DIR}/private/${FQDN}.key.pem \
    -new -sha256 -out ${BASE_DIR}/csr/${FQDN}.csr.pem

# To create a certificate, use the intermediate CA to sign the CSR. If the
# certificate is going to be used on a server, use the server_cert extension. If
# the certificate is going to be used for user authentication, use the usr_cert
# extension. Certificates are usually given a validity of one year, though a CA
# will typically give a few days extra for convenience.

SERVER_FQDN=www.server1.example.com
openssl ca \
    -config ${BASE_OPENSSL_CONF} \
    -extensions server_cert -days 375 -notext -md sha256 \
    -in ${BASE_DIR}/csr/${FQDN}.csr.pem \
    -out ${BASE_DIR}/certs/${SERVER_FQDN}.cert.pem

# chmod 444 ${BASE_DIR}/certs/${SERVER_FQDN}.cert.pem

