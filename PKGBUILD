# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=ghi
pkgver=0.9.2
pkgrel=1
pkgdesc='GitHub Issues on the command line'
arch=('any')
url='https://github.com/stephencelis/ghi'
license=('MIT')
depends=('ruby')
optdepends=('ruby-ronn: for building the man-pages yourself')
source=("https://github.com/stephencelis/ghi/archive/${pkgver}.tar.gz")
sha256sums=('5e7d964801b32eb3d5f1ba92f5324152a290a1675a8d85dfd476ac6aae1f5b4e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  rake build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX="${pkgdir}/usr/" rake install
}
sha256sums=('1109e0c4baf3088dc45fe72243e4089ed324e6ac6281fc57b170996b17f9b1c2')
