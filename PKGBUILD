# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=('python-mistletoe')
pkgver=0.8.1
pkgrel=1
pkgdesc='A fast, extensible Markdown parser in pure Python.'
arch=('any')
url='https://github.com/miyuchina/mistletoe'
license=('MIT')
makedepends=('python-setuptools')
source=(https://github.com/miyuchina/mistletoe/archive/v${pkgver}.tar.gz)
sha512sums=('52bc7fdf5576a7ff8300e9d28df0795defe1a9b76044382f9cb95d16d27ae797f2572b34a88b2939d3b6b2832507b5c9228445d3b7229cc515594a56e7e821af')

package() {
  cd "$srcdir/mistletoe-$pkgver"
  python setup.py install --root="$pkgdir" -O1
}
