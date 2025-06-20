# Maintainer: Kearan Lynch jtgthebeatplugsa@gmail.com
pkgname=gordysays
pkgver=1.0
pkgrel=1
pkgdesc="A simple cowsay-style ASCII app with a big-headed boy"
arch=('x86_64')
url="https://github.com/arch-user-sudo/gordysays"
license=('MIT')
depends=()
source=("https://github.com/arch-user-sudo/gordysays/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ebbb7f127390b22f12c0c091f16839308080ea86f4a690cebc07585e6d90fab1')

build() {
  cd "$srcdir/gordysays-${pkgver}"
  gcc -o gordysays gordysays.c
}

package() {
  cd "$srcdir/gordysays-${pkgver}"
  install -Dm755 gordysays "$pkgdir/usr/bin/gordysays"
}
