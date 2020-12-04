#!/usr/bin/env sh

if [ -f /usr/lib/code/product.json ]; then
  patch /usr/lib/code/product.json </usr/share/code-marketplace/code.patch
elif [ -f /usr/share/vscodium-bin/resources/app/product.json ]; then
  patch /usr/share/vscodium-bin/resources/app/product.json </usr/share/code-marketplace/vscodium-bin.patch
fi
