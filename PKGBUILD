# Maintainer: aksr <aksr at t-com dot me>
pkgname=sccs
pkgver=5.08
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
md5sums=('4cebb77bb7c216fb8e2d7340daf7bf3e')
sha1sums=('eb0da0771f70f72cf57c55b49207e3a5fb33295a')
sha256sums=('5ea2898f25272e81f7725d9cd0c6c416bc9b1b3a765acb08855feaef8295692a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

