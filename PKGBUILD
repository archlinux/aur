# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=pear-net-ldap3
pkgver=1.0.2
pkgrel=1
pkgdesc='Object oriented interface for searching and manipulating LDAP-entries'
url='http://www.kolab.org'
arch=('any')
license=('PHP')
depends=('php-ldap' 'pear-net-ldap2')
makedepends=('php-pear')
source=("http://mirror.kolabsys.com/pub/releases/pear-Net-LDAP3-${pkgver}.tar.gz")
sha256sums=('50b9d5c1175a16309c8fb18696ea07232683dd5cce900a2203c1b0488001692a')

package() {
    mkdir -p "${pkgdir}/usr/share/pear"
    cp -dpr --no-preserve=ownership "${srcdir}/pear-Net-LDAP3-${pkgver}/lib/Net" \
        "${pkgdir}/usr/share/pear"
}
