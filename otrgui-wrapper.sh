#!/bin/sh

SHIP_PREFIX=/opt/soh

ORIGDIR=$PWD
OTRGUIDIR="$(mktemp -d /tmp/otrgui-XXXXX)"
ln -s "${SHIP_PREFIX}/assets" "${OTRGUIDIR}"
ln -s "${SHIP_PREFIX}/OTRGui" "${OTRGUIDIR}"

cd "${OTRGUIDIR}"
./OTRGui

rm -rf "${OTRGUIDIR}"
