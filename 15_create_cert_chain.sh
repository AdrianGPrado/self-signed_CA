###############################################################################
# Create the certificate chain file
# 
# When an application (eg, a web browser) tries to verify a certificate signed by
# the intermediate CA, it must also verify the intermediate certificate against
# the root certificate. To complete the chain of trust, create a CA certificate
# chain to present to the application.
# 
# To create the CA certificate chain, concatenate the intermediate and root
# certificates together. We will use this file later to verify certificates signed
# by the intermediate CA.
# 
# Note:
# 
# Our certificate chain file must include the root certificate because no client
# application knows about it yet. A better option, particularly if you’re
# administrating an intranet, is to install your root certificate on every client
# that needs to connect. In that case, the chain file need only contain your
# intermediate certificate.
###############################################################################

ROOT_DIR=./ca
BASE_DIR=${ROOT_DIR}/intermediate
FQDN=www.example.com

cat ${BASE_DIR}/certs/${FQDN}.cert.pem \
    ${ROOT_DIR}/certs/ca.cert.pem > ${BASE_DIR}/certs/ca-chain.cert.pem

# chmod 444 intermediate/certs/ca-chain.cert.pem

