#!/usr/bin/env sh
GPG="gpg --keyserver pgp.mit.edu"

while read key; do
    ${GPG} --recv-keys ${key}
    ${GPG} --passphrase "$1" --batch --yes --sign-key ${key}
    ${GPG} --send-keys ${key}
done

${GPG} --refresh-keys
