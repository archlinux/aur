#!/bin/bash
# Configure the installed XRDP ini files.
# use vsock transport.

# shellcheck disable=SC2164
cd "$(dirname -- "$0")"

if grep -q '1|y|Y' rdp_config.lock; then
  exit 1
fi

cp -f /etc/xrdp/xrdp.ini{,_orig}

# https://github.com/neutrinolabs/xrdp/issues/1260#issuecomment-753970464
sed -ri 's/port=3389/port=vsock:\/\/-1:3389 tcp:\/\/:3389/g' /etc/xrdp/xrdp.ini
# use rdp security.
sed -ri 's/security_layer=negotiate/security_layer=rdp/g' /etc/xrdp/xrdp.ini
# remove encryption validation.
sed -ri 's/crypt_level=high/crypt_level=none/g' /etc/xrdp/xrdp.ini
# disable bitmap compression since its local its much faster
sed -ri 's/bitmap_compression=true/bitmap_compression=false/g' /etc/xrdp/xrdp.ini
#
# sed -n -e 's/max_bpp=32/max_bpp=24/g' /etc/xrdp/xrdp.ini

# use the default lightdm x display
# sed -ri 's/X11DisplayOffset=10/X11DisplayOffset=0/g' /etc/xrdp/sesman.ini
# rename the redirected drives to 'shared-drives'
sed -ri_orig 's/FuseMountName=thinclient_drives/FuseMountName=shared-drives/g' /etc/xrdp/sesman.ini

echo Y >rdp_config.lock
echo "RDP Configured"
