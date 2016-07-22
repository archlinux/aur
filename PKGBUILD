# Maintainer: ngld <ngld@tproxy.de>
_pyname=semantic_version
pkgname=python-semantic-version
pkgver=2.5.0
pkgrel=1
pkgdesc="A library implementing the 'SemVer' scheme."
arch=('any')
url="https://github.com/rbarrois/python-semanticversion"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-$pkgver.tar.gz")
sha256sums=('3baad35dcb074a49419539cea6a33b484706b6c2dd03f05b67763eba4c1bb65c')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
