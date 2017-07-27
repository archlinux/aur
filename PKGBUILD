# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=pear-net-ldap3
pkgver=1.0.4
pkgrel=3
pkgdesc='Object oriented interface for searching and manipulating LDAP-entries'
url='http://www.kolab.org'
arch=('any')
license=('PHP')
depends=('php-ldap' 'pear-net-ldap2' 'php-pear')
makedepends=()
source=("https://mirror.kolabenterprise.com/pub/releases/pear-Net-LDAP3-${pkgver}.tar.gz")
sha256sums=('bc8ae49a38836021a275ff1293ac58e02d505716d54963b584816575351d260d')

package() {
    mkdir -p "${pkgdir}/usr/share/pear"
    cp -dpr --no-preserve=ownership "${srcdir}/pear-Net-LDAP3-${pkgver}/lib/Net" \
        "${pkgdir}/usr/share/pear"
}
