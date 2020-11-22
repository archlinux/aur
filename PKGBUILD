# Maintainer: Buce <dmbuce@gmail.com>

pkgname=mcexplore
pkgver=1.7
pkgrel=1
pkgdesc="Use a minecraft server to generate a square of land."
arch=(any)
url="https://github.com/DMBuce/mcexplore"
license=('CCPL:by-sa')
groups=()
depends=(python python-nbt)
makedepends=('git' 'asciidoc')
source=("$pkgname::git://github.com/DMBuce/${pkgname}.git#tag=$pkgver")
#source=("$pkgname::git+ssh://git@mantrid/~/${pkgname}.git#tag=$pkgver")
noextract=()
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"
  make prefix=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
