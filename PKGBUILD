# Maintainer: AquaUseful
pkgname=autobright-openrc
pkgdesc='Openrc script for autobright'
pkgver=2.0.0
pkgrel=1
arch=('any')
url='https://github.com/AquaUseful/autobright-openrc'
license=('MIT')
groups=()
depends=('autobright')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/AquaUseful/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0ca3086eea79ed8e16e38d7da99009cd8ded3c03850e214cd0c4aaaa0f09f82b')

package() {
    install -m 755 -D "${srcdir}/${pkgname}-${pkgver}/autobright.initd" "$pkgdir/etc/init.d/autobright"
    install -m 755 -D "${srcdir}/${pkgname}-${pkgver}/autobright.confd" "$pkgdir/etc/conf.d/autobright"
}
