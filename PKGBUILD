# Maintainer: AquaUseful
pkgname=autobright-openrc
pkgdesc='Openrc script for autobright'
pkgver=1.0.0
pkgrel=1
arch=('any')
url='https://github.com/AquaUseful/autobright-openrc'
license=('MIT')
groups=()
depends=('autobright')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AquaUseful/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('dc616378cca48bb8072b6ba5f6a7af8ea71afb136fa3038dae522a07d10f1cf3')

package() {
    install -m 755 -D "${srcdir}/${pkgname}-${pkgver}/autobright.initd" "$pkgdir/etc/init.d/autobright"
    install -m 755 -D "${srcdir}/${pkgname}-${pkgver}/autobright.confd" "$pkgdir/etc/conf.d/autobright"
}
