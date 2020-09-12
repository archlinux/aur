#!/bin/bash
echo "Building packages..."

CARCH=x86_64 makepkg --force >/dev/null 2>/dev/null
if [[ "$?" == "0" ]]; then echo "x86_64:  ok"; else echo "x86_64:  fail"; fi

CARCH=i686 makepkg --force  >/dev/null 2>/dev/null
if [[ "$?" == "0" ]]; then echo "i686:    ok"; else echo "i686:    fail"; fi

CARCH=arm makepkg --force >/dev/null 2>/dev/null
if [[ "$?" == "0" ]]; then echo "arm*:    ok"; else echo "arm*:    fail"; fi

CARCH=aarch64 makepkg --force >/dev/null 2>/dev/null
if [[ "$?" == "0" ]]; then echo "aarch64: ok"; else echo "aarch64: fail"; fi
