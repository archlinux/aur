# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=pear-net-ldap3
pkgver=1.0.3
pkgrel=1
pkgdesc='Object oriented interface for searching and manipulating LDAP-entries'
url='http://www.kolab.org'
arch=('any')
license=('PHP')
depends=('php-ldap' 'pear-net-ldap2')
makedepends=('php-pear')
source=("http://mirror.kolabsys.com/pub/releases/pear-Net-LDAP3-${pkgver}.tar.gz")
sha256sums=('a7cd419705b6be29b996f94034db871d0e38f516b55eb026c07c8ce993d5a311')

package() {
    mkdir -p "${pkgdir}/usr/share/pear"
    cp -dpr --no-preserve=ownership "${srcdir}/pear-Net-LDAP3-${pkgver}/lib/Net" \
        "${pkgdir}/usr/share/pear"
}
