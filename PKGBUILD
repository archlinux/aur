# Maintainer: koonix <ehsan at disroot dot org>

pkgname=pacycle
pkgver=r1
pkgrel=2
pkgdesc='Cycle the default audio output device of pulseaudio.'
url='https://github.com/koonix/pacycle'
arch=('any')
license=('Unlicense')
depends=('pulseaudio' 'bash')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('983c51d3e8d55deb3e0359c5f54e50ef76e438f88edd2177294890e6462b0eaa')

package() {
    cd "${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
