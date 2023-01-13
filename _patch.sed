1 i # Maintainer: Sven Hebrok <xoimex[at]gmail[dot]com>
1 i # Automatically created from cuops PKGBUILD

s/# Maintainer: (.+)/# Upstream Maintainer: \1/g

s/.\/configure (.+) \\/.\/configure \1 --with-gssapi \\/

# replace cups with cups-gssapi in package definitions
/^(pkgbase|pkgname)=/ s/cups/cups-gssapi/g
/^package_\S*cups\(\)/ s/cups/cups-gssapi/g

# Replace description of subpackages
/^pkgdesc=/ s/(.*)"$/\1 - with gssapi (kerberos) enabled"/

# add further fields
/^pkgbase=/ i pkgdesc="The CUPS Printing System with gssapi (kerberos) enabled"
/^pkgbase=/ i conflicts=('libcups' 'cups')

# fix usage of "${pkgbase}"
s/\$\{pkgbase\}/cups/g
