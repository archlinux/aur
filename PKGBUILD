#
# PKGBUILD for iselect
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=iselect
pkgver=1.4.0
pkgrel=2
epoch=
pkgdesc="Interactive Terminal Selection"
arch=('i686', 'x86_64')
url="http://www.ossp.org/pkg/tool/iselect/"
license=('unknown')
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
source=(ftp://ftp.ossp.org/pkg/tool/iselect/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('d278a61fe2557f9ce8270328b5f7b3b6')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sh configure --prefix="$pkgdir/"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  #make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# EOF
