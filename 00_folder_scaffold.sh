#!/bin/bash


ROOT_DIR=./ca
mkdir ${ROOT_DIR}
mkdir ${ROOT_DIR}/certs 
mkdir ${ROOT_DIR}/crl
mkdir ${ROOT_DIR}/newcerts
mkdir ${ROOT_DIR}/private
chmod 700 ${ROOT_DIR}/private
touch ${ROOT_DIR}/index.txt
echo 1000 > ${ROOT_DIR}/serial

BASE_DIR=${ROOT_DIR}/intermediate
mkdir ${BASE_DIR}
mkdir ${BASE_DIR}/certs
mkdir ${BASE_DIR}/crl
mkdir ${BASE_DIR}/csr
mkdir ${BASE_DIR}/newcerts
mkdir ${BASE_DIR}/private
chmod 700 ${BASE_DIR}/private
touch ${BASE_DIR}/index.txt
echo 1000 > ${BASE_DIR}/serial

