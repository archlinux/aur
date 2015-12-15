# Maintainer: Renato Garcia <fgarcia.renato@gmail.com>

pkgname=python-importmagic
pkgver=0.1.3
pkgrel=1
pkgdesc="Automatically manage imports in Python"
arch=('any')
url="https://github.com/alecthomas/importmagic"
license=('BSD')
depends=('python')
source=("https://pypi.python.org/packages/source/i/importmagic/importmagic-${pkgver}.tar.gz")
md5sums=('6828187b7d9f1084fb8b09fcfb95381d')

package() {
  cd "${srcdir}/importmagic-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
