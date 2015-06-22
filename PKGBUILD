#
# PKGBUILD for bosh
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=bosh
pkgver=0.6
pkgrel=1
epoch=
pkgdesc="Browsable Output SHell"
arch=('i686', 'x86_64')
url="http://bosh.sourceforge.net/"
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
source=(http://sourceforge.net/projects/bosh/files/bosh/bosh%200.6/bosh-0.6.tar.gz/download)
noextract=()
md5sums=('975ef183ed4d2314186b1f2705d57c65')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sh configure
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
