# Contributor: Simon Legner <simon.legner@gmail.com>
pkgname=puppy
pkgver=1.14
pkgrel=2
pkgdesc="Communication with a Topfield TF5000 or TF6000 PVRs via a USB port"
arch=('i686' 'x86_64')
url="http://www.nslu2-linux.org/wiki/Puppy/HomePage"
license=('GPL')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://prdownloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}_${pkgver}_src.tar.bz2)
noextract=()
md5sums=('a7a53da5b8ba4fdb15e2fc8e1531b82c')

build() {
  cd "$srcdir/${pkgname}_${pkgver}"
  make || return 1
}

package() {
  cd "$srcdir/${pkgname}_${pkgver}"
  install -D -m 755 puppy "$pkgdir/usr/bin/puppy"
}
