# Maintainer: Renato Garcia <fgarcia.renato@gmail.com>

pkgname=python-importmagic
pkgver=0.1.6
pkgrel=1
pkgdesc="Automatically manage imports in Python"
arch=('any')
url="https://github.com/alecthomas/importmagic"
license=('BSD')
depends=('python')
source=("https://pypi.python.org/packages/source/i/importmagic/importmagic-${pkgver}.tar.gz")
md5sums=('e2a870154c6a8b895e66e3f7d72bfd27')

package() {
  cd "${srcdir}/importmagic-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
