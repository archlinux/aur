# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

pkgname=lesspass
pkgver=10.0.0
pkgrel=1
pkgdesc='Stateless open source password manager'
arch=('any')
url='https://lesspass.com'
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('631f086e58041753c4098ad8bbf1577cd21c2263069425e5f3df025de054d414')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize='1'
}
