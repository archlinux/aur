# Maintainer: Kiri <kiri_so@gmail.com>
pkgname=lumins-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A fast and reliable alternative to rsync for synchronizing local files"
arch=('x86_64')
url="https://github.com/wchang22/LuminS"
license=('MIT')
provides=('lms')
install=
source=("https://github.com/wchang22/LuminS/releases/download/v${pkgver}/lms"
"LICENSE::https://raw.githubusercontent.com/wchang22/LuminS/master/LICENSE")
md5sums=('445e0424e4ea278b5afcd0bd45d5735e'
         'b288a44ff8d3a8991c44878b97794c58')

package() {
  cd "${srcdir}"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/lumins-bin/LICENSE
  install -Dm755 "$srcdir"/lms -t "$pkgdir"/usr/bin/
}
