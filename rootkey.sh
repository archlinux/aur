#!/bin/bash
key=$(mktemp)
gpgkey=$(mktemp)
chmod 0700 "$key"
chmod 0700 "$gpgkey"
read -rsep 'cryptsetup root container password: ' passphrase
echo -n "$passphrase" > "$key"
gpg \
        --s2k-cipher-algo aes256 --s2k-digest-algo sha512 --s2k-mode 3 --s2k-count 100000 \
        --yes -o "$gpgkey" -c "$key"
rm "$key"
printf '\n'
sudo mv "$gpgkey" /rootkey.gpg
echo "don't forget to run mkinitcpio now"
