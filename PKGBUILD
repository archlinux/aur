# Maintainer: aksr <aksr at t-com dot me>
pkgname=utroff
pkgver=0.3
pkgrel=2
epoch=
pkgdesc="A set of macro, pre-processors, and post-processors to use easily Heirloom Troff today."
arch=('i686' 'x86_64')
url="http://utroff.org/"
license=('custom:BSD')
groups=()
depends=('heirloom-doctools')
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
source=("http://download.tuxfamily.org/$pkgname/pub/$pkgname-$pkgver.tar.gz")
noextract=()
options=()
md5sums=('590d785bd3b2591eac350e9202fba128')
sha1sums=('7a4e88269d249407b88e75b12709651210d62fa5')
sha256sums=('72346b951b9115af66ab9aa6c818481edc78ccaa8831806521c0c77db5683244')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

