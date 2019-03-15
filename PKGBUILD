# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>

pkgname=('python-mistletoe')
pkgver=0.7.1
pkgrel=1
pkgdesc='A fast, extensible Markdown parser in pure Python.'
arch=('any')
url='http://mistletoe.afteryu.me/'
license=('MIT')
makedepends=('python-setuptools')
source=(https://github.com/miyuchina/mistletoe/archive/v${pkgver}.tar.gz)
sha256sums=('420e1eeace013547364da0f92cca234b2088fd0941792e41307e10c3c35b375e')

package() {
  cd "$srcdir/mistletoe-$pkgver"
  python setup.py install --root="$pkgdir" -O1
}
