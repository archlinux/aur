#!/bin/sh

echo "vim"

pkgfile -rd "^/usr/lib/perl5/" | sed 's#^.*/##' | sort -u

pkgfile -r "^/usr/lib/perl5/vendor_perl/auto/.*\.so$" | sed 's#^.*/##' | sort -u
ssh soyuz.archlinux.org PATH=/usr/local/bin:\$PATH\; /home/bluewind/bin/sogrep-all libperl.so

# this one is optional
#pkgfile -r '^/usr/share/perl5/'  | sed 's#^.*/##' | sort -u
