# Maintainer: aksr <aksr at t-com dot me>
pkgname=sccs
pkgver=5.09
pkgrel=1
epoch=
pkgdesc="The UNIX Source Code Control System actively maintained/enhanced."
arch=('i686' 'x86_64')
url="http://sccs.sourceforge.net/"
license=('CDDL' 'GPL')
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2")
noextract=()
options=()
md5sums=('564efd2019ba7dd968ebebeeaae252e8')
sha1sums=('5ca6cac3a44d517b016c948da308fd7934745dfe')
sha256sums=('331bf09d1fb2ca01739e5f97cc46c6ef134661535f2ce541f90b5b9548be431b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

