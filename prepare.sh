#!/bin/bash
prog=$0

VER=2.1.1
FILE=phantomjs-${VER}-linux-x86_64.tar.bz2

usage() {
  echo 'Usage: $prog [-y]'
}

YES=0

while getopts ":y" opt; do
  case "$opt" in
    y)
      YES=1
      ;;
    *)
      echo "Invalid options"
      usage
      exit 1
      ;;
  esac
done

if [ ${YES} -eq 0 ]; then
  echo "This script is going to download phantomjs ${VER} from official website and store it as phantomjs_linux-x86_64. Do you want to do that? [y/N]: "

  read ans

  if [ "z${ans}" == "zy" ] || [ "z${ans}" == "zY" ]; then
    YES=1
  fi
fi

if [ ${YES} -ne 1 ]; then
  exit 0
fi

curl -k -L https://bitbucket.org/ariya/phantomjs/downloads/${FILE} > /tmp/${FILE}

TMPDIR=$(mktemp -d /tmp/phantomjs-install-XXXXXX)

if [ -z "${TMPDIR}" ]; then
  echo "Failed to create temporary directory"
  exit 1
fi

tar -jxf /tmp/${FILE} -C ${TMPDIR}
cd $(dirname ${prog})
cp ${TMPDIR}/*/bin/phantomjs phantomjs_linux-x86_64
chmod 0755 phantomjs_linux-x86_64
rm -rf ${TMPDIR}
rm -f /tmp/${FILE}

echo "Finish preparing phantomjs executable binary"








