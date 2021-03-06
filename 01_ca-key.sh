###############################################################################
# Create the root key
# 
# Create the root key (ca.key.pem) and keep it absolutely secure. Anyone in
# possession of the root key can issue trusted certificates. Encrypt the root key
# with AES 256-bit encryption and a strong password.
# 
# Note
# 
# Use 4096 bits for all root and intermediate certificate authority keys. You’ll
# still be able to sign server and client certificates of a shorter length.
###############################################################################


#!/bin/bash

openssl genrsa -out ./ca/private/ca.key.pem 2048


