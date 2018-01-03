#!/bin/sh

mypath() {
    path="$1"
    path="$(readlink "$path")"
    parent="$(dirname "$path")"
    saved_umask="$(umask)"
    umask 022
    mkdir -p "$parent"
    umask "$saved_umask"
    echo "$path"
}

openssl_ciphers() {
    tr -d '\n' <<EOF
ECDHE-ECDSA-CHACHA20-POLY1305:
ECDHE-RSA-CHACHA20-POLY1305:
DHE-RSA-CHACHA20-POLY1305:
ECDHE-ECDSA-AES256-GCM-SHA384:
ECDHE-RSA-AES256-GCM-SHA384:
DHE-RSA-AES256-GCM-SHA384:
ECDHE-ECDSA-AES128-GCM-SHA256:
ECDHE-RSA-AES128-GCM-SHA256:
DHE-RSA-AES128-GCM-SHA256:
ECDHE-ECDSA-AES256-SHA384:
ECDHE-RSA-AES256-SHA384:
DHE-RSA-AES256-SHA256:
ECDHE-ECDSA-AES128-SHA256:
ECDHE-RSA-AES128-SHA256:
DHE-RSA-AES128-SHA256
EOF
}