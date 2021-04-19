# Maintainer: AquaUseful
pkgname=autobright
pkgdesc='Bash script to adjust screen brightness based on ambient lighting'
pkgver=1.0.1
pkgrel=2
arch=('any')
url='https://github.com/AquaUseful/autobright'
license=('MIT')
groups=()
depends=('ffmpeg')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/AquaUseful/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6e4b8f8f938205c22ce19a7b1a76155b0dc4dec22e07f0fc7bd8cd77643f5cd4')

package() {
    install -m 755 -D "${srcdir}/${pkgname}-${pkgver}/autobright" "${pkgdir}/usr/bin/autobright"
}
