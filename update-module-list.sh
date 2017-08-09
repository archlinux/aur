#!/bin/bash

MODULES_FILE=modules.list
VERS="$(awk -F= '/pkgver=/{ print $2 }' PKGBUILD)"
: ${LOG:=/var/lib/dkms/tbs-linux_media-git/$VERS/build/make.log}

old_checksum=$(sha256sum "$MODULES_FILE" | awk '{print $1}')

echo "Using '$LOG' (overwrite with \$LOG)." 2>&1
grep LD $LOG | grep -o 'v4l/.*\.ko' | sort | sed 's#^v4l/##;s#\.ko$##' | awk '
    BEGIN{
        i=0
    };
    {
        print "\
BUILT_MODULE_NAME["i"]=\""$0"\"\n\
BUILT_MODULE_LOCATION["i"]=\"media_build/v4l\"\n\
DEST_MODULE_LOCATION["i"]=\"/extramodules/v4l\"";
        i++ }' > "$MODULES_FILE"

new_checksum=$(sha256sum "$MODULES_FILE" | awk '{print $1}')
echo "Setting new sha256sum: $new_checksum."

sed -i "s/'$old_checksum'/'$new_checksum'/" PKGBUILD
