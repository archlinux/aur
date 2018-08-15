# Maintainer: Emanuel Couto <unit73e at gmail dot com>
# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Contributor: Simon Conseil <contact+aur at saimon dot org>

pkgname=python-sexpdata
pkgver=0.0.3
pkgrel=3
pkgdesc="S-expression parser for Python"
arch=('any')
url="https://github.com/tkf/sexpdata"
license=('BSD')
depends=('python')
source=("https://pypi.python.org/packages/source/s/sexpdata/sexpdata-${pkgver}.tar.gz")
sha256sums=('1ac827a616c5e87ebb60fd6686fb86f8a166938c645f4089d92de3ffbdd494e0')

package() {
  cd "$srcdir/sexpdata-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
