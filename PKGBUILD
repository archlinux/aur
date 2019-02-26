# Maintainer: Jonathan Eyolfson <jon@eyl.io>
pkgname=dynamorio
pkgver=7.1.0
_pkgver=7.1.0-1
pkgrel=1
pkgdesc="A dynamic binary instrumentation framework"
url="http://dynamorio.org"
arch=('x86_64' 'i686')
license=('BSD')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://github.com/DynamoRIO/dynamorio/releases/download/release_${pkgver}/DynamoRIO-Linux-${_pkgver}.tar.gz")
sha256sums=('46da89f507881d1da38113b2fd8aa0d85dacfa94cca67ac9f6551b974386100c')

package() {
  cd "${srcdir}/DynamoRIO-Linux-${_pkgver}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "${pkgdir}/opt/dynamorio"
  cp -a * ${pkgdir}/opt/dynamorio
}
