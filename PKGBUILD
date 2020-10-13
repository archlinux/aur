# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fractus-atlas-bin
pkgver=1.14.0
pkgrel=1
pkgdesc="An image viewer which allows you to quickly move them in folders"
url="https://github.com/Jimskapt/fractus-atlas"
arch=('x86_64')
license=('custom')
provides=('fractus-atlas')
conflicts=('fractus-atlas')
depends=('webkit2gtk')
source=("${pkgname}-${pkgver}::https://github.com/Jimskapt/fractus-atlas/releases/download/${pkgver}/fractus-atlas-${pkgver}-linux-x86_64")
sha256sums=('2fe906737eea2f4fae8ff9cbf6df8661508e86da3fdc79874eee27b1650f3f2a')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/fractus-atlas-bin"
}
