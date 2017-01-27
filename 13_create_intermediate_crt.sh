###############################################################################
# Create the intermediate certificate
# 
# Use the intermediate key to create a certificate signing request (CSR). The
# details should generally match the root CA. The Common Name, however, must be
# different.
# 
# Warning
# 
# Make sure you specify the intermediate CA configuration file
# (intermediate/openssl.cnf).
###############################################################################


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

ROOT_DIR=./ca
BASE_DIR=${ROOT_DIR}/intermediate
SSL_INTERMEDIATE_CONF=openssl.intermediate.cnf
FQDN=www.example.com

openssl req  \
    -config ${SSL_INTERMEDIATE_CONF} -new -sha256 \
    -key ${BASE_DIR}/private/${FQDN}.key.pem \
    -out ${BASE_DIR}/csr/${FQDN}.csr.pem 


# To create an intermediate certificate, use the root CA with the
# v3_intermediate_ca extension to sign the intermediate CSR. The intermediate
# certificate should be valid for a shorter period than the root certificate. Ten
# years would be reasonable.

# Warning
# This time, specify the root CA configuration file (/root/ca/openssl.cnf).
SSL_ROOT_CONF=openssl.root.cnf

openssl ca -config ${SSL_ROOT_CONF} -extensions v3_intermediate_ca \
    -days 3650 -notext -md sha256 \
    -in ${BASE_DIR}/csr/${FQDN}.csr.pem \
    -out ${BASE_DIR}/certs/${FQDN}.cert.pem

# Enter pass phrase for ca.key.pem: secretpassword
# Sign the certificate? [y/n]: y

# chmod 444 intermediate/certs/intermediate.cert.pem
