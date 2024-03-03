# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-core'
_name='azure-core'
pkgver='1.30.1'
pkgrel=1
pkgdesc="Microsoft Azure Core Library for Python"
url="https://pypi.org/project/azure-core/"
depends=('python-requests' 'python-six' 'python-typing_extensions')
makedepends=('python-setuptools')
optdepends=('python-aiohttp')
license=('MIT')
arch=('any')
source=("https://pypi.io/packages/source/a/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('26273a254131f84269e8ea4464f3560c731f29c0c1f69ac99010845f239c1a8f')

package() {
  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
