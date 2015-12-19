# Maintainer: ngld <ngld@tproxy.de>
_pyname=semantic_version
pkgname=python-semantic-version
pkgver=2.4.2
pkgrel=1
pkgdesc="A library implementing the 'SemVer' scheme."
arch=('any')
url="https://github.com/rbarrois/python-semanticversion"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-$pkgver.tar.gz")
sha256sums=('7e8b7fa74a3bc9b6e90b15b83b9bc2377c78eaeae3447516425f475d5d6932d2')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
