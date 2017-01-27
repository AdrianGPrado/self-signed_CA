###############################################################################
# Create the intermediate key
# 
# Create the intermediate key (intermediate.key.pem). Encrypt the intermediate key
# with AES 256-bit encryption and a strong password.
###############################################################################


ROOT_DIR=./ca
BASE_DIR=${ROOT_DIR}/intermediate
FQDN=www.example.com

openssl genrsa -aes256 -out ${BASE_DIR}/private/${FQDN}.key.pem 4096

# chmod 400 ${BASE_DIR}/private/${FQDN}.key.pem
