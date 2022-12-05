# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

pkgname=lesspass
pkgver=10.1.1
pkgrel=1
pkgdesc='Stateless open source password manager'
arch=('any')
url='https://lesspass.com'
license=('GPL')
depends=('python')
optdepends=('python-requests: for load an save configurations from remote server')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('2b1983a867b66c042fdab29800a91bdeaa1da05e40c9a1414b76b341cc203217eb23e7497aabff05a54f1dd81a7b9bf547f1aa2c41b0788a5bbdd58e0f33751f')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize='1'
}
