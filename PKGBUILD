# PKGBUILD for cdls
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
pkgname=cdls
pkgver=4.2
pkgrel=4
epoch=
pkgdesc="A curses based file manager for system managers"
arch=('i686' 'x86_64')
url="https://www.freshports.org/sysutils/cdls/"
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
source=("ftp://freebsd4ever.xs4all.nl/cdls-4.2.tar.gz")
#source=("ftp://freebsd4ever.xs4all.nl/cdls-4.2.tar.gz")
#source=("ftp://pd7w.fs2a.eu/cdls-4.2.tar.gz")
#source=("ftp://zml12.dyndns.org/cdls-4.2.tar.gz")
#source=("ftp://vps337.directvps.nl/cdls-4.2.tar.gz")
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
