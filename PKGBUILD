# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=('python-mistletoe')
pkgver=0.8.2
pkgrel=1
pkgdesc='A fast, extensible Markdown parser in pure Python.'
arch=('any')
url='https://github.com/miyuchina/mistletoe'
license=('MIT')
makedepends=('python-setuptools')
source=(https://github.com/miyuchina/mistletoe/archive/v${pkgver}.tar.gz)
sha512sums=('2591a39ffdf52d3b33f6dbe4534f907e0f9bb1c980d7c6112b844415ef3576e835877140a918a15e9a02ce1911156e18af8d7106153f72d84a2886ad77adb551')

package() {
  cd "$srcdir/mistletoe-$pkgver"
  python setup.py install --root="$pkgdir" -O1
}
