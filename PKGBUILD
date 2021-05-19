# Maintainer: AquaUseful
pkgname=autobright
pkgdesc='Bash script to adjust screen brightness based on ambient lighting'
pkgver=2.1.0
pkgrel=1
arch=('any')
url='https://github.com/AquaUseful/autobright'
license=('MIT')
groups=()
depends=('ffmpeg' 'bash' 'bc')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/AquaUseful/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7c3d28fae140f24c0878d0775fa3ca10481de25ff031b19e913d290d8b3de012')

package() {
    install -m 755 -D "${srcdir}/${pkgname}-${pkgver}/autobright" "${pkgdir}/usr/bin/autobright"
    install -m 644 -D "${srcdir}/${pkgname}-${pkgver}/autobright.conf" "${pkgdir}/etc/autobright.conf"
}
