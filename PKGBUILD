# Maintainer: AquaUseful
pkgname=autobright-openrc
pkgdesc='Openrc script for autobright'
pkgver=1.0.1
pkgrel=1
arch=('any')
url='https://github.com/AquaUseful/autobright-openrc'
license=('MIT')
groups=()
depends=('autobright')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/AquaUseful/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('27c77367bee59f6c35bfca498fbbe7ac7bebac5f2c7524fb52eded26def525d0')

package() {
    install -m 755 -D "${srcdir}/${pkgname}-${pkgver}/autobright.initd" "$pkgdir/etc/init.d/autobright"
    install -m 755 -D "${srcdir}/${pkgname}-${pkgver}/autobright.confd" "$pkgdir/etc/conf.d/autobright"
}
