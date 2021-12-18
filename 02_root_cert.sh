#!/usr/bin/env bash

WORKDIR='/tmp/ssl/ca'

CONFIG="./ca.ini"

PRIVATE_KEY="ca.key.pem"
ROOT_CA="ca.cert.pem"

cp "./${CONFIG}" "$WORKDIR/${CONFIG}"

mkdir -p "${WORKDIR}/certs"
mkdir -p "${WORKDIR}/private"
cd "${WORKDIR}"

openssl req -config "./${CONFIG}" \
    -key "./private/${PRIVATE_KEY}" \
    -new -x509 -days 3560 -sha256 -extensions v3_ca \
    -out "./certs/${ROOT_CA}" 

chmod 444 "./certs/${ROOT_CA}"
