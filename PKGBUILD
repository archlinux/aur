# Maintainer: Alexander Nicholi <me@nicholatian.com>
pkgname=gbafix
pkgver=1
pkgrel=1
epoch=
pkgdesc="Fix GBA ROM file headers."
arch=('i686' 'x86_64')
url="https://code.caveoforig.in/alex/$pkgname"
license=('GPL-2.0')
depends=()
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+https://code.caveoforig.in/alex/$pkgname.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"

  install -Dsm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
