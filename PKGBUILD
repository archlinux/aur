# Maintainer: Your Name <youremail@domain.com>
pkgname=nbimg
pkgver=1.1
pkgrel=1
pkgdesc="Allows to convert HTC Splash Screen images from NB to BMP and create NB splash screens from BMP format"
arch=('x86_64' 'i686')
url="http://pof.eslack.org/2008/07/03/nbimg-htc-splash-screen-tool/"
license=('GPL')
depends=()
makedepends=()
source=(http://pof.eslack.org/HTC/nbimg/$pkgname-$pkgver.tar.gz)
md5sums=('e1e49ef98311abfa8de7375294a1f1d9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  gcc -o nbimg nbimg.c
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  cp $srcdir/$pkgname-$pkgver/nbimg $pkgdir/usr/bin

}

# vim:set ts=2 sw=2 et:
