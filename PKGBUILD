# Maintainer: Mišo Barišić <me@misobarisic.com>
pkgname="yoku-bin"
_pkgname="yoku"
pkgver=0.1.1
pkgrel=0
pkgdesc="Markdown based TUI todo"
arch=('x86_64')
url="https://github.com/misobarisic/yoku"
license=('GPL3')
conflicts=('yoku-bin' 'yoku-git')
provides=('yoku')
source=("${pkgname}.tar.gz::https://github.com/misobarisic/yoku/releases/download/v${pkgver}/yoku-linux.tar.gz")
sha256sums=("61ad230c25b6cc44311c8a1c4ba274d8b616ab5ac74d561a95a42d888b7957a1")

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "yoku" "$pkgdir/usr/bin"
}
