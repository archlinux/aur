#!/bin/bash

set -euo pipefail

CERT_ROOT="${CERT_ROOT:-${HOME}/.local/share/http-remote-pc-control/certs}"
SAN_CNF="/usr/share/http-remote-pc-control/san.cnf"

if [ -f "${CERT_ROOT}/key.pem" ] ; then
  exit 0
fi

if ! command -v openssl >/dev/null 2>&1; then
  echo "certificates not found in the system. Either create them in $CERT_ROOT" >&2
  echo "Either install openssl: sudo pacman -S openssl" >&2
  exit 1
fi

umask 077

mkdir -p "${CERT_ROOT}"
mkdir -p "${CERT_ROOT}/ca"
mkdir -p "${CERT_ROOT}/client"

openssl genrsa -out "${CERT_ROOT}/ca/ca-key.pem" 2048
openssl req -new -x509 -key "${CERT_ROOT}/ca/ca-key.pem" -out "${CERT_ROOT}/ca/ca-cert.pem" -days 3650 -subj "/C=US/ST=CA/L=SF/O=Example Org/CN=Example Root CA"

openssl genrsa -out "${CERT_ROOT}/key.pem" 2048
openssl req -new -key "${CERT_ROOT}/key.pem" -out "${CERT_ROOT}/csr.pem" -subj "/C=US/ST=CA/L=SF/O=Example Org/CN=localhost"

openssl x509 -req -in "${CERT_ROOT}/csr.pem" -CA "${CERT_ROOT}/ca/ca-cert.pem" -CAkey "${CERT_ROOT}/ca/ca-key.pem" -CAcreateserial -out "${CERT_ROOT}/cert.pem" -days 365 -extfile "${SAN_CNF}" -extensions v3_req

cp "${CERT_ROOT}/ca/ca-cert.pem" "${CERT_ROOT}/ca-cert.pem"

openssl genrsa -out "${CERT_ROOT}/client/key.pem" 2048
openssl req -new -key "${CERT_ROOT}/client/key.pem" -out "${CERT_ROOT}/client/csr.pem" -subj "/C=US/ST=CA/L=SF/O=Example Org/CN=Client"

openssl x509 -req -in "${CERT_ROOT}/client/csr.pem" -CA "${CERT_ROOT}/ca/ca-cert.pem" -CAkey "${CERT_ROOT}/ca/ca-key.pem" -CAcreateserial -out "${CERT_ROOT}/client/cert.pem" -days 365

cp "${CERT_ROOT}/ca/ca-cert.pem" "${CERT_ROOT}/client/ca-cert.pem"

rm -f "${CERT_ROOT}/csr.pem"
rm -f "${CERT_ROOT}/client/csr.pem"
rm -f "${CERT_ROOT}/ca/ca-cert.srl"
rm -f "${CERT_ROOT}/ca/ca-cert.pem"
