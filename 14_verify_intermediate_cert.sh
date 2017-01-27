###############################################################################
# Verify the intermediate certificate
###############################################################################

ROOT_DIR=./ca
BASE_DIR=${ROOT_DIR}/intermediate
FQDN=www.example.com

# As we did for the root certificate, check that the details of the intermediate
# certificate are correct.

openssl x509 -noout -text \
    -in ${BASE_DIR}/certs/${FQDN}.cert.pem

# Verify the intermediate certificate against the root certificate. An OK
# indicates that the chain of trust is intact.

openssl verify -CAfile ${ROOT_DIR}/certs/ca.cert.pem \
    ${BASE_DIR}/certs/${FQDN}.cert.pem
