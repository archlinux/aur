# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>

pkgname=('python-mistletoe')
pkgver=0.5.4
pkgrel=1
pkgdesc='A fast, extensible Markdown parser in pure Python.'
arch=('any')
url='http://mistletoe.afteryu.me/'
license=('MIT')
makedepends=('python-setuptools')
source=(https://github.com/miyuchina/mistletoe/archive/v0.5.4.tar.gz)
sha256sums=('1044297c082b162a1c6f37a61a86d6b68ac1520282fcdce3ffd70ab48755e1af')

package() {
  cd "$srcdir/mistletoe-$pkgver"
  python setup.py install --root="$pkgdir" -O1
}
