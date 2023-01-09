# Maintainer: Mišo Barišić <me@misobarisic.com>
pkgname="yoku-bin"
_pkgname="yoku"
pkgver=0.1.2
pkgrel=0
pkgdesc="Markdown based TUI todo"
arch=('x86_64')
url="https://github.com/misobarisic/yoku"
license=('GPL3')
conflicts=('yoku-bin' 'yoku-git')
provides=('yoku')
source=("${pkgname}.tar.gz::https://github.com/misobarisic/yoku/releases/download/v${pkgver}/yoku-linux.tar.gz")
sha256sums=("0e33fc6f44ef79dc4e626ca8bebba29a41ecd751ffee67b7248d9da89f549569")

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "yoku" "$pkgdir/usr/bin"
}
