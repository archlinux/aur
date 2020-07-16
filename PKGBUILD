# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-munge
pkgver=1.0.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/93/df/26c480d579fc4e6818cc5d8e5eccec4aa80acd341bfe1c1d2bd0072cac80/munge-${pkgver}.tar.gz")
sha256sums=('e531dd74f9fa7279d39914dd7576e49c781dd89a1eadfba67ea450e72b308361')

package() {
  cd "munge-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}