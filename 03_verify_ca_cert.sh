# Verify the root certificate

#!/bin/bash

openssl x509 -noout -text -in ./ca/certs/ca.cert.pem
