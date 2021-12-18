#!/usr/bin/env bash
CERTPATH="${1}"

openssl x509 -noout -text -in "${CERTPATH}"
