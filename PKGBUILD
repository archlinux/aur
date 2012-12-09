# Maintainer: Thomas Weißschuh <thomas_weissschuh lavabit.com>

pkgname=ghi
pkgver=0.9.0.20121114
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

# vim:set ts=2 sw=2 et:
