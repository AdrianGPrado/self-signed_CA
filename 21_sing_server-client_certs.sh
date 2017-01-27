###############################################################################
# Sign server and client certificates
# 
# We will be signing certificates using our intermediate CA. You can use these
# signed certificates in a variety of situations, such as to secure connections to
# a web server or to authenticate clients connecting to a service.
# 
# Note
# 
# The steps below are from your perspective as the certificate authority. A
# third-party, however, can instead create their own private key and certificate
# signing request (CSR) without revealing their private key to you. They give you
# their CSR, and you give back a signed certificate. In that scenario, skip the
# genrsa and req commands.
# Create a key
# 
# Our root and intermediate pairs are 4096 bits. Server and client certificates
# normally expire after one year, so we can safely use 2048 bits instead.
# 
# Note
# 
# Although 4096 bits is slightly more secure than 2048 bits, it slows down TLS
# handshakes and significantly increases processor load during handshakes. For
# this reason, most websites use 2048-bit pairs.
# If you’re creating a cryptographic pair for use with a web server (eg, Apache),
#     you’ll need to enter this password every time you restart the web server.
#     You may want to omit the -aes256 option to create a key without a password.
###############################################################################


ROOT_DIR=./ca
BASE_DIR=${ROOT_DIR}/intermediate
FQDN=www.example2.com

openssl genrsa -aes256 -out ${BASE_DIR}/private/${FQDN}.key.pem 2048

# chmod 400 ${BASE_DIR}/private/${FQDN}

