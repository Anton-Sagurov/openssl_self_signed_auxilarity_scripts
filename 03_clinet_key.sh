#!/usr/bin/env bash

DOMAIN="${1}"

if [ -z "${DOMAIN}" ];then
  echo "ERROR: DOMAIN not provided"
  exit 1
fi

###############################################
WORKDIR="/tmp/ssl/client/${DOMAIN}"          ##
CONFIG="${DOMAIN}.ini"                       ##
###                                          ##
ROOT_CA="/tmp/ssl/ca/certs/ca.cert.pem"      ##
PRIVATE_KEY="/tmp/ssl/ca/private/ca.key.pem" ##
###                                          ##
PRIVATE_KEY="${DOMAIN}.key.pem"              ##
CERTIFICATE="${DOMAIN}.cert.pem"             ##
REQUEST="${DOMAIN}.csr.pem"                  ##
###############################################

mkdir -p "${WORKDIR}"
cp "./${CONFIG}" "${WORKDIR}/${CONFIG}"
cd "${WORKDIR}"

echo "Generate key"
openssl genrsa -out "./${PRIVATE_KEY}" 2048
chmod 600 "./${PRIVATE_KEY}"

echo "Generate certificate request"
openssl req -new -key "./${PRIVATE_KEY}" -out "./${REQUEST}" -config "./${CONFIG}" 
chmod 600 "./${REQUEST}"

echo "Generate certificate"
openssl ca -config "./${CONFIG}" \
      -extensions server_cert -days 400 -notext -md sha256 \
      -in "./${REQUEST}" \
      -out "./${CERTIFICATE}" \
      -verbose
chmod 444 "./${CERTIFICATE}"
