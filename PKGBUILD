# Maintainer: Renato Garcia <fgarcia.renato@gmail.com>

pkgname=python-importmagic
pkgver=0.1.6
pkgrel=2
pkgdesc="Automatically manage imports in Python"
arch=('any')
url="https://github.com/alecthomas/importmagic"
license=('BSD')
depends=('python')
source=("https://github.com/alecthomas/importmagic/archive/${pkgver}.tar.gz")
md5sums=('7c7fd0beb81c85a64c6d9b85ee9f5e14')

package() {
  cd "${srcdir}/importmagic-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
