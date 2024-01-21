# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname='python-azure-core'
_name='azure-core'
pkgver='1.29.7'
pkgrel=1
pkgdesc="Microsoft Azure Core Library for Python"
url="https://pypi.org/project/azure-core/"
depends=('python-requests' 'python-six' 'python-typing_extensions')
makedepends=('python-setuptools')
optdepends=('python-aiohttp')
license=('MIT')
arch=('any')
source=("https://pypi.io/packages/source/a/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2944faf1a7ff1558b1f457cabf60f279869cabaeef86b353bed8eb032c7d8c5e')

package() {
  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
