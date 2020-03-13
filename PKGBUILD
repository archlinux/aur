pkgname=python-pytablewriter
pkgver=0.50.0
pkgrel=1
pkgdesc="Python library to write a table in various formats"
arch=(any)
url="https://github.com/thombashi/pytablewriter"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-xlwt' 'python-dominate' 'python-simplejson' 'python-toml' 'python-loguru' 'python-elasticsearch')
source=("https://pypi.io/packages/source/p/pytablewriter/pytablewriter-$pkgver.tar.gz")
sha256sums=('aa483f67653b130b50f076763d7a2e84fff3c096c032ffd64b78e735edc21a3d')

package() {
  cd pytablewriter-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
