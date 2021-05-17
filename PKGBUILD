# Maintainer: AquaUseful
pkgname=autobright
pkgdesc='Bash script to adjust screen brightness based on ambient lighting'
pkgver=2.0.2
pkgrel=1
arch=('any')
url='https://github.com/AquaUseful/autobright'
license=('MIT')
groups=()
depends=('ffmpeg' 'bash' 'bc')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/AquaUseful/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a215358421608c4aa7d41a3d5399acf23f1a0c5db77339b32c228d7e2f9efaf8')

package() {
    install -m 755 -D "${srcdir}/${pkgname}-${pkgver}/autobright" "${pkgdir}/usr/bin/autobright"
    install -m 644 -D "${srcdir}/${pkgname}-${pkgver}/autobright.conf" "${pkgdir}/etc/autobright.conf"
}
