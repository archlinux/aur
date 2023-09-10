#!/bin/bash
# Configure the installed XRDP ini files.
# use vsock transport.
cd "$(dirname -- "$0")" || exit 1

declare XRDP_CONFIGURED=xrdp_configured.txt

if grep -qE '1|y|Y' "$XRDP_CONFIGURED" 2>/dev/null; then
  echo "xrdp server is already configured!"
  echo "unlink $(readlink -f "$XRDP_CONFIGURED") to force reconfigure."
  exit 0
fi

# use both vsock/tcp
# https://github.com/neutrinolabs/xrdp/issues/1260#issuecomment-753970464

# https://devicetests.com/fix-xrdp-connection-issue-kde-plasma-ubuntu-20-04
sed -i_orig -e 's/port=3389/port=vsock:\/\/-1:3389 tcp:\/\/:3389/g' \
  -e 's/security_layer=negotiate/security_layer=rdp/g' \
  -e 's/crypt_level=high/crypt_level=none/g' \
  -e 's/bitmap_compression=true/bitmap_compression=false/g' \
  -e 's/^new_cursors=true/new_cursors=false/g' \
  /etc/xrdp/xrdp.ini

# rename the redirected drives to 'shared-drives'
sed -i_orig -r 's/FuseMountName=[\w]+/FuseMountName=shared-drives/g' /etc/xrdp/sesman.ini

echo Y >"$XRDP_CONFIGURED"

echo "xrdp server is successfully configured!"
