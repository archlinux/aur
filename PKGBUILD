# Maintainer: alexcoder04 <alexcoder04@protonmail.com>
pkgname=shclrz
pkgver=0.3.1
pkgrel=1
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
sha256sums=('98706e0d07a005c364330cd612e62f4e4a0c5b13e431fba1f37e8b8b5f443db6')

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir/" make install
}
