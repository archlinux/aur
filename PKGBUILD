
pkgname=libxdiff
pkgver=0.23
pkgrel=1
pkgdesc="The LibXDiff library implements basic and yet complete functionalities to create file differences/patches"
arch=(i686 x86_64)
url="http://www.xmailserver.org/xdiff-lib.html"
license=('GPL')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!libtool)
install=
source=(http://www.xmailserver.org/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('8970281543130411d8a1b1f004a8418b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
