#!/bin/bash

# Exit script on error
set -xe
mkdir -p ./gencert/client
mkdir -p ./gencert/server
mkdir -p ./gencert/ca

# Generate CA Key and Certificate
openssl genrsa -out ./gencert/ca/ca-key.pem 2048
openssl req -new -x509 -key ./gencert/ca/ca-key.pem -out ./gencert/ca/ca-cert.pem -days 3650 -subj "/C=US/ST=CA/L=SF/O=Example Org/CN=Example Root CA"

# Generate Server Key and CSR
openssl genrsa -out ./gencert/server/key.pem 2048
openssl req -new -key ./gencert/server/key.pem -out ./gencert/server/csr.pem -subj "/C=US/ST=CA/L=SF/O=Example Org/CN=localhost"

# Sign Server Certificate with CA including SAN
openssl x509 -req -in ./gencert/server/csr.pem -CA ./gencert/ca/ca-cert.pem -CAkey ./gencert/ca/ca-key.pem -CAcreateserial -out ./gencert/server/cert.pem -days 365 -extfile san.cnf -extensions v3_req

# Generate Client Key and CSR
openssl genrsa -out ./gencert/client/key.pem 2048
openssl req -new -key ./gencert/client/key.pem -out ./gencert/client/csr.pem -subj "/C=US/ST=CA/L=SF/O=Example Org/CN=Client"

# Sign Client Certificate with CA
openssl x509 -req -in ./gencert/client/csr.pem -CA ./gencert/ca/ca-cert.pem -CAkey ./gencert/ca/ca-key.pem -CAcreateserial -out ./gencert/client/cert.pem -days 365

cp ./gencert/ca/ca-cert.pem ./gencert/client/ca-cert.pem
cp ./gencert/ca/ca-cert.pem ./gencert/server/ca-cert.pem

rm ./gencert/ca/ca-cert.pem
rm ./gencert/ca/ca-cert.srl

rm ./gencert/server/csr.pem
rm ./gencert/client/csr.pem

echo "Done!"
