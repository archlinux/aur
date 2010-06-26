# Contributor: Tom Killian <tom@archlinux.org>
# Contributor: Nikos Kouremenos (zeppelin) kourem at gmail dot com
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=autocutsel
pkgver=0.9.0
pkgrel=3
pkgdesc="synchronizes the two copy/paste buffers mainly used by X applications"
arch=('i686' 'x86_64')
depends=('libxaw')
source=(http://lepton.fr/tools/autocutsel/autocutsel-$pkgver.tar.gz)
md5sums=('ba4a6f632cb4815ae4e5c3027c24cfc5')
url="http://lepton.fr/tools/autocutsel/"
license=('GPL')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr install
}
