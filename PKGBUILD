# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=ghi
pkgver=1.0.3
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

sha256sums=('98ddf904bfd78d7363986b75ecea294933c8b98d9c1d2828419fddcaeadc0fdd')
