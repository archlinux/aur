# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-munge
pkgver=1.1.0
pkgrel=1
pkgdesc='Data manipulation client/library'
arch=('any')
url="https://pypi.org/project/munge"
license=('Apache')
depends=('python-yaml'
         'python-click'
         'python-future'
         'python-requests')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/58/8e/bff3f079540a0727dfd126512eec0b3f7c4b23fb01c9cb0e1cf335509dff/munge-1.1.0.tar.gz")
sha256sums=('a5ec65d880a7e7fdfb3c8a4ff05e0826250f94d866c88be6191a80da6344020d')

package() {
  cd "munge-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
