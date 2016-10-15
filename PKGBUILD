# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=ghi
pkgver=1.2.0
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

sha256sums=('ffc17cfbdc8b88bf208f5f762e62c211bf8fc837f447354ad53cce39b1400671')
