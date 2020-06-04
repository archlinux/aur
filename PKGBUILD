# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

pkgname=lpacli
pkgver=0.1.1
pkgrel=1
pkgdesc='CLI helper to get LessPass paswords configuration directly from a LessPass server'
arch=('any')
url='https://lesspass.com'
license=('GPL')
depends=('lesspass')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8f767fa84074bc43436ad216ab2ff001a86cbfe821ed0c75ed66156b95061a4c')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize='1'
}
