#!/bin/bash
set -e

SOURCE=$1; shift
SHA_SUM=$1; shift

name=$(basename $SOURCE)
sha_check="$SHA_SUM $name"

cd /tmp
wget -nv "$SOURCE"
echo $sha_check | sha256sum -c

cd /usr/src/nextcloud/apps
tar xf /tmp/$name
rm /tmp/$name
