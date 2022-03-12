# Maintainer: Mišo Barišić <me@misobarisic.com>
pkgname="yoku-bin"
_pkgname="yoku"
pkgver=0.1.0
pkgrel=0
pkgdesc="Markdown based TUI todo"
arch=('x86_64')
url="https://github.com/misobarisic/yoku"
license=('GPL3')
makedepends=('cargo' 'rust')
conflicts=('yoku-bin' 'yoku-git')
provides=('yoku')
source=("${pkgname}.tar.gz::https://github.com/misobarisic/yoku/releases/download/v${pkgver}/yoku-linux.tar.gz")
sha256sums=("8322fa71fdbee2226f865ad64ef71c23f372c490f3f972764b37aa3dcd162612")

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "yoku" "$pkgdir/usr/bin"
}
