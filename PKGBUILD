# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python2-img2text
pkgdesc="Python library for converting images into ascii art"
pkgver=2.4
pkgrel=1
url="https://github.com/mmarica/python-img2text"
depends=('python2')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/25/95/5dbfd5b4084c89d93ffea8a962623c1fb89bf22d9797c9a17acdbf0ecc5d/img2txt.py-${pkgver}.tar.gz")
md5sums=('bfa6e34584a699a337cde6f0727ae187')

build() {
  cd "${srcdir}/img2txt.py-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/img2txt.py-${pkgver}"
  python2 setup.py install --root="$pkgdir" --optimize=1 
}
