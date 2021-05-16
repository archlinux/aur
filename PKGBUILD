# Maintainer: AquaUseful
pkgname=autobright
pkgdesc='Bash script to adjust screen brightness based on ambient lighting'
pkgver=2.0.1
pkgrel=2
arch=('any')
url='https://github.com/AquaUseful/autobright'
license=('MIT')
groups=()
depends=('ffmpeg' 'bash' 'bc')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/AquaUseful/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9ccbb9dd91f8b446080fc1fec7ef66e3b7ec1ac3b3de3733f7608dfa7708b8bb')

package() {
    install -m 755 -D "${srcdir}/${pkgname}-${pkgver}/autobright" "${pkgdir}/usr/bin/autobright"
    install -m 644 -D "${srcdir}/${pkgname}-${pkgver}/autobright.conf" "${pkgdir}/etc/autobright.conf"
}
