# Maintainer: Renato Garcia <fgarcia.renato@gmail.com>

pkgname=python-importmagic
pkgver=0.1.7
pkgrel=1
pkgdesc="Automatically manage imports in Python"
arch=('any')
url="https://github.com/alecthomas/importmagic"
license=('BSD')
depends=('python')
source=("https://github.com/alecthomas/importmagic/archive/${pkgver}.tar.gz")
md5sums=('56cc5721cea2c0907544c709da368193')

package() {
  cd "${srcdir}/importmagic-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
