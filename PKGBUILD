# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Ron B.S <ronthecookie0101 on gmail --OR-- me AT ronthecookie DOT me >
pkgname=('python-mistletoe-0.6.2')
pkgver=0.6.2
pkgrel=1
pkgdesc='A fast, extensible Markdown parser in pure Python.'
arch=('any')
url='http://mistletoe.afteryu.me/'
license=('MIT')
makedepends=('python-setuptools')
source=(https://github.com/miyuchina/mistletoe/archive/v0.6.2.tar.gz)
sha256sums=('ea9f89e379f33a14af1093413545c3ff302d1a17710a2f8ee37c7ad70a5072a8')
conflicts=('python-mistletoe')

package() {
  cd "$srcdir/mistletoe-$pkgver"
  python setup.py install --root="$pkgdir" -O1
}
