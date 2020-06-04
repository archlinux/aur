# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

pkgname=lpacli
pkgver=0.1.2
pkgrel=1
pkgdesc='CLI helper to get LessPass paswords configuration directly from a LessPass server'
arch=('any')
url='https://lesspass.com'
license=('GPL')
depends=('lesspass')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c2dc1dad7e0490164761c66508f2ed758de0099e9cab45a7133c7b573accb13c')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize='1'
}
