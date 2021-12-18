#!/usr/bin/env bash

dir="/tmp/ssl/ca"
certs="$dir/certs"
crl_dir="$dir/crl"
new_certs_dir="$dir/newcerts"

DIRECTORIES=("${dir}" "${certs}" "${crl_dir}" "${new_certs_dir}")

# Do not use '*' in bash arrays!
for i in "${DIRECTORIES[@]}";do
  mkdir -p "${i}"
done 

database="$dir/index.txt"
serial="$dir/serial"

FILES=("${database}" "${serial}")
for f in "${FILES[@]}";do
  touch "${f}"
done 

