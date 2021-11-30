# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

pkgname=lesspass
pkgver=10.1.0
pkgrel=1
pkgdesc='Stateless open source password manager'
arch=('any')
url='https://lesspass.com'
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('c368b1478c42172427029188638f6f68319a6f62f1661f4cd7c17cf885875ed0b60b36072ad7d1b95719da7a65b3f5987c084988787f684d0d2afafc0f96065a')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize='1'
}
