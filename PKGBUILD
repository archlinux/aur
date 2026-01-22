# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

pkgname=lesspass
pkgver=10.2.1
pkgrel=1
pkgdesc='Stateless open source password manager'
arch=('any')
url='https://lesspass.com'
license=('GPL-3.0-or-later')
depends=('python')
optdepends=('python-requests: for load an save configurations from remote server')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('3ac9480dc55f0a3849d42d7d24275b73d566c9cb0636d4f0337e020d7f32e41b57e394ba6abbf6616be68b3f09452994dbd4aa7f0edfd5aff2604b0fe739dd9c')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize='1'
}
