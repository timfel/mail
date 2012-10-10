#!/bin/sh

owd="$PWD"
containing_dir="$( cd "$( dirname "$0" )" && pwd )"

# prepare libmail
echo "bootstrapping libmail" 1>&2
libmail_dir="$containing_dir/../lib/libmail/build-mac"
cd "$libmail_dir"
./update.sh
if [ $? -ne 0 ]; then
  echo "bootstrapping libmail failed" 1>&2
  cd "$owd"
  exit 1
fi

cd "$owd"
