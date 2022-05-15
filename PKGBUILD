# Maintainer: alexcoder04 <alexcoder04@protonmail.com>
pkgname=kherson
pkgver=1.0.2
pkgrel=1
pkgdesc="Minimal status line generator for i3/sway written in Go"
arch=('x86_64')
url="https://github.com/alexcoder04/kherson"
license=('GPL3')
groups=()
depends=()
makedepends=(go)
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
md5sums=('0b4e411bd696090303742ef46df38fb2')

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir/" make install
}
