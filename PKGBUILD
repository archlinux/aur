# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: snafu <regflx@web.de>
pkgname=genders
pkgver=1.14
pkgrel=1
pkgdesc="Static cluster configuration datatbase used for cluster configuration management."
arch=(x86_64 i686)
url="http://sourceforge.net/projects/genders"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://sourceforge.net/projects/genders/files/genders/$pkgver-$pkgrel/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('8d645f331fd8636b2d8e830c65d06255')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
