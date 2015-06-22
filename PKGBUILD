# PKGBUILD for cdls
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
pkgname=cdls
pkgver=4.2
pkgrel=2
epoch=
pkgdesc="A curses based file manager for system managers"
arch=('i686', 'x86_64')
url="ftp://pd7w.fs2a.eu/cdls-4.2.tar.gz"
license=('public domain')
groups=()
depends=('ncurses')
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
source=(ftp://pd7w.fs2a.eu/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('4ed5f945ebb53838f7a60c0c4f634d0b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  cp cdls "$pkgdir/usr/bin/cdls"
}

# EOF
