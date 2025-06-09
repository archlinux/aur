# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=unixel-fonts
pkgver=1.0
pkgrel=1
pkgdesc="An English-Arabic pixel font."
arch=('any')
url="https://github.com/MDarvishi5124/Unixel"
license=('OFL')
provides=('unixel' 'unixel-fonts')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a68feb3adad37bd708bb4bbebaa3e72111ecd20140dda585df025f7d35915d4f')

package() {
  cd "${srcdir}/Unixel-${pkgver}"

  install -Dm644 font/unixel-Regular.ttf \
    "${pkgdir}/usr/share/fonts/TTF/unixel-Regular.ttf"

  install -Dm644 OFL.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
