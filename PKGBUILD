# Submbitter: Eric Bélanger <eric@archlinux.org>
# Maintainer: McNoggins <gagnon88 (at) gmail (dot) com>

pkgname=qt3-doc
pkgver=3.3.8b
pkgrel=3
epoch=1
pkgdesc="A cross-platform application and UI framework (Documentation)"
arch=('any')
url="http://qt.io"
license=('GPL' 'custom:QPL')
depends=('qt3')
source=(http://download.qt.io/archive/qt/3/qt-x11-free-${pkgver}.tar.gz)
sha256sums=('1b7a1ff62ec5a9cb7a388e2ba28fda6f960b27f27999482ebeceeadb72ac9f6e')

package() {
  cd "${srcdir}/qt-x11-free-${pkgver}"
  install -d "${pkgdir}/opt/qt/doc"
  cp -r doc/html "${pkgdir}/opt/qt/doc/"
  install -Dm644 LICENSE.QPL "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.QPL"
}
