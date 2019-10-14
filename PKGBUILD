# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>

pkgname=('python-mistletoe')
pkgver=0.7.2
pkgrel=1
pkgdesc='A fast, extensible Markdown parser in pure Python.'
arch=('any')
url='https://github.com/miyuchina/mistletoe'
license=('MIT')
makedepends=('python-setuptools')
source=(https://github.com/miyuchina/mistletoe/archive/v${pkgver}.tar.gz)
sha256sums=('263ba6a27ed6b01c48fcb592a6073b0c70c027cce476d649caf421602c8a7322')

package() {
  cd "$srcdir/mistletoe-$pkgver"
  python setup.py install --root="$pkgdir" -O1
}
