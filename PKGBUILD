# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

pkgname=lesspass
pkgver=9.1.9
pkgrel=1
pkgdesc='Stateless open source password manager'
arch=('any')
url='https://lesspass.com'
license=('GPL')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a0ef5fff83f9b120cb579673cbb72b64bdc51bef5ac98aa32ffc774f27be6003')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize='1'
}
