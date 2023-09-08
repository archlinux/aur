#!/bin/bash
# Configure the installed XRDP ini files.
# use vsock transport.

# shellcheck disable=SC2164
cd "$(dirname -- "$0")"

if grep -q '1|y|Y' rdp_config.lock; then
  exit 1
fi

# https://github.com/neutrinolabs/xrdp/issues/1260#issuecomment-753970464
sed -i_orig -e 's/port=3389/port=vsock:\/\/-1:3389 tcp:\/\/:3389/g' \
  -e 's/security_layer=negotiate/security_layer=rdp/g' \
  -e 's/crypt_level=high/crypt_level=none/g' \
  -e 's/bitmap_compression=true/bitmap_compression=false/g' \
  /etc/xrdp/xrdp.ini

# rename the redirected drives to 'shared-drives'
sed -i_orig -e 's/FuseMountName=thinclient_drives/FuseMountName=shared-drives/g' /etc/xrdp/sesman.ini

echo Y >rdp_config.lock
echo "RDP Configured"
