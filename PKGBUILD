# Maintainer: AquaUseful
pkgname=autobright
pkgdesc='Bash script to adjust screen brightness based on ambient lighting'
pkgver=2.0.0
pkgrel=1
arch=('any')
url='https://github.com/AquaUseful/autobright'
license=('MIT')
groups=()
depends=('ffmpeg' 'bash' 'bc')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/AquaUseful/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('974ca5cbd5880c075e5813300463255f4df88df3d56066815722575e6fd7cf1c')

package() {
    install -m 755 -D "${srcdir}/${pkgname}-${pkgver}/autobright" "${pkgdir}/usr/bin/autobright"
    install -m 644 -D "${srcdir}/${pkgname}-${pkgver}/autobright.conf" "${pkgdir}/etc/autobright.conf"
}
