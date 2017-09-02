# Maintainer: Tarn Burton <twburton at gmail dot com>
# Contributor: Milo Mirate <mmirate at gmx.com>

_pkgname=Pweave
pkgname=python-pweave
pkgver=0.30.1
pkgrel=1
pkgdesc="A scientific report generator and literate programming tool for Python."
arch=(any)
url="http://mpastell.com/pweave/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/16/93/a29e8909c3945ea7ee89cde5a0aa03d7004efc2d3020b867dae81045f9bc/Pweave-0.30.1.tar.gz")
sha256sums=('323b96d2e90d2cebe62d4942933fc29807bdf0d2728236d55155b3b21615ef4a')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
