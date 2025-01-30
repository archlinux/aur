# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=cairo-msg
pkgver=0.2 # from 2 cairo-msg.h
_commit=a39942e2ec1b72e41849d90d8418563e7312de51
pkgrel=1
pkgdesc="A small splash program for UNIX like OS"
arch=(i686 x86_64)
license=('GPL2')
url="https://github.com/01micko/cairo-msg"
depends=('cairo')
makedepends=('git')
source=("$pkgname::git+https://github.com/01micko/cairo-msg.git#commit=$_commit")
md5sums=('SKIP')

build() {
  cd $pkgname
  make
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
