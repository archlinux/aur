# Contributor: Zafer "xaph" CAKMAK <mzcakmak [at] gmail.com>
pkgname=pidgin-cmds
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple Shout plugin on pidgin"
arch=('i686')
url="http://code.google.com/p/pidgin-cmds/"
license=('GPL')
groups=()
depends=('pidgin' 'glib2')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://pidgin-cmds.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
noextract=()
md5sums=('6db24f4400b787c32364c8ac386f37b9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
