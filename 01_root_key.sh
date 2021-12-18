#!/usr/bin/env bash

WORKDIR='/tmp/ssl/ca'

PRIVATE_KEY="ca.key.pem"

mkdir -p "${WORKDIR}/private"
cd "${WORKDIR}"

openssl genrsa -aes256 -out ./private/"${PRIVATE_KEY}" 2048

chmod 400 ./private/"${PRIVATE_KEY}"
