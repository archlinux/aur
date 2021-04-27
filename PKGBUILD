# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

pkgname=lpacli
pkgver=0.3.0
pkgrel=1
pkgdesc='CLI helper to get LessPass paswords configuration directly from a LessPass server'
arch=('any')
url='https://github.com/ogarcia/lpacli'
license=('GPL')
depends=('lesspass')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('552110def8e8c726819cc778c967989a18788862b7045f371cdbef50147f30b9')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize='1'
}
