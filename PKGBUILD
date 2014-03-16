# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=ghi
pkgver=0.9.3
pkgrel=1
pkgdesc='GitHub Issues on the command line'
arch=('any')
url='https://github.com/stephencelis/ghi'
license=('MIT')
depends=('ruby')
optdepends=('ruby-ronn: for building the man-pages yourself')
source=("https://github.com/stephencelis/ghi/archive/${pkgver}.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  rake build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX="${pkgdir}/usr/" rake install
}
sha256sums=('1b58c7ec6e9339c44175808719694d7ee21cbd254d3a2e6d31a70d31027e9bea')
