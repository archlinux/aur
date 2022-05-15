# Maintainer: alexcoder04 <alexcoder04@protonmail.com>
pkgname=kherson
pkgver=1.0.0
pkgrel=1
pkgdesc="minimal status line generator for i3/sway written in go"
arch=('x86_64')
url="https://github.com/alexcoder04/kherson"
license=('GPL3')
groups=()
depends=()
makedepends=(git go)
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
md5sums=('cce6cc0301024f583081dfc529013798')

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir/" make install
}
