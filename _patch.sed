1 i # Maintainer: Sven Hebrok <xoimex[at]gmail[dot]com>
1 i # Automatically created from cuops PKGBUILD

s/# Maintainer: (.+)/# Upstream Maintainer: \1/g

s/.\/configure (.+) \\/.\/configure \1 --enable-gssapi --with-cups-build="cups-gssapi-${pkgver}" \\/

# replace cups with cups-gssapi in package definitions
/^(pkgbase|pkgname)=/ s/cups/cups-gssapi/g
/^package_\S*cups\(\)/ s/cups/cups-gssapi/g

# Replace description of subpackages
/^pkgdesc=/ s/(.*)"$/\1 - with gssapi (kerberos) enabled"/

# add krb5 dependency (was removed upstream)
# makedepends is multiline - insert after first line
/^makedepends=/ a 'krb5'

/^package_libcups-gssapi\(\)/,/depends=/ {
    /depends=/ a depends+=("krb5")
}

# add provides fields to subpackages
/^package_cups-gssapi\(\)/ a provides=('cups')
/^package_libcups-gssapi\(\)/ a provides=("libcups=${pkgver%.r*}")

/^package_cups-gssapi\(\)/ a conflicts=('cups')
/^package_libcups-gssapi\(\)/ a conflicts=('libcups')

# fix usage of "${pkgbase}"
s/\$\{pkgbase\}/cups/g

# remove cups-filters make dependency as it is just causing trouble, and should only be a post-install dependency (already is for cups, not for libcups)
/^makedepends=/ s/'cups-filters' //

# if we do more patches, use this to update pkgrel:
# s/pkgrel=3/pkgrel=3.2/
