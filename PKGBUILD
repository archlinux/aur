# Maintainer: AquaUseful
pkgname=autobright
pkgdesc='Bash script to adjust screen brightness based on ambient lighting'
pkgver=1.0.0
pkgrel=1
arch=('any')
url='https://github.com/AquaUseful/autobright'
license=('MIT')
groups=()
depends=('ffmpeg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AquaUseful/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('da20d2d9ca9d52a585927990bfc5bb409b2cee49ae1008f233cd11d16860ed89')

package() {
    install -m 755 -D "${srcdir}/${pkgname}-${pkgver}/autobright" "${pkgdir}/usr/bin/autobright"
}
