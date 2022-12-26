# Maintainer: alexcoder04 <https://github.com/alexcoder04>
pkgname=shclrz
pkgver=0.3.0
pkgrel=1
epoch=
pkgdesc="coloring output in the shell"
arch=('any')
url="https://github.com/alexcoder04/shclrz"
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
md5sums=('f292c2e57ad2f69a998a18b209e50672')
validpgpkeys=()

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir/" make install
}
