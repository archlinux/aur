pkgname=python-pypistats
pkgver=0.10.1
pkgrel=1
pkgdesc="Python interface to PyPI Stats API"
arch=(any)
url="https://github.com/hugovk/pypistats"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-appdirs' 'python-pytablewriter' 'python-dateutil' 'python-slugify' 'python-requests')
source=("https://pypi.io/packages/source/p/pypistats/pypistats-$pkgver.tar.gz")
sha256sums=('572d0778a52415c2aa67fc729c5a61a36e082a1885758bb77b83cf274d00b4a3')

package() {
  cd pypistats-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
