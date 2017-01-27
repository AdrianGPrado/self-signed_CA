
BASE_DIR=./ca/intermediate

SERVER_FQDN=www.server1.example.com
KEY=${SERVER_FQDN}.key.pem
CRT=${SERVER_FQDN}.cert.pem

mkdir ./ready_to_deploy
cp ${BASE_DIR}/certs/ca-chain.cert.pem ./ready_to_deploy
cp ${BASE_DIR}/certs/${CRT}            ./ready_to_deploy
cp ${BASE_DIR}/private/${KEY}          ./ready_to_deploy

