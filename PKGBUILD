# Maintainer: AquaUseful
pkgname=autobright
pkgdesc='Bash script to adjust screen brightness based on ambient lighting'
pkgver=2.2.0
pkgrel=1
arch=('any')
url='https://github.com/AquaUseful/autobright'
license=('MIT')
groups=()
depends=('ffmpeg' 'bash' 'bc')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/AquaUseful/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f34953e665d5087c6ec75119fa186f995ab444d23edc7ab22905baeb2cbf7837')

package() {
    install -m 755 -D "${srcdir}/${pkgname}-${pkgver}/autobright" "${pkgdir}/usr/bin/autobright"
    install -m 644 -D "${srcdir}/${pkgname}-${pkgver}/autobright.conf" "${pkgdir}/etc/autobright.conf"
}
