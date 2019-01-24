# Contributor: Bernhard Walle <bernhard@bwalle.de>
pkgname=grabc
pkgver=1.0.2
pkgrel=1
epoch=2
pkgdesc="A utility for reporting the color of a pixel."
arch=('i686' 'x86_64')
url="https://github.com/muquit/grabc"
license=('GPL')
depends=(libx11)
makedepends=(libx11)
source=("https://github.com/muquit/grabc/archive/v$pkgver.tar.gz")
md5sums=('3a3f39a7ee35b140d82a97c3d78e74c4')
sha512sums=('5371f21f08a5b9cbadd3c8cfb2c21c916e1c31f2b0aecaec42836fe80be8177bc7a0f79eb78250ac1638c83dff1dca41faead7a7994bce47c87b22d7044acf2a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  mkdir -p $pkgdir/usr/bin/
  cp "$srcdir/$pkgname-$pkgver/grabc" $pkgdir/usr/bin/
}
