# Maintainer: Alexander Nicholi <me@nicholatian.com>
pkgname=jsonproc
pkgver=1
pkgrel=1
epoch=
pkgdesc="Process JSON for Gen 3 pret repository data"
arch=('i686' 'x86_64')
url="https://code.caveoforig.in/alex/$pkgname"
license=('BSD-2')
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
