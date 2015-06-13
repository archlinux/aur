# Maintainer: ngld <ngld@tproxy.de>
_pyname=semantic_version
pkgname=python-semantic-version
pkgver=2.4.1
pkgrel=1
pkgdesc="A library implementing the 'SemVer' scheme."
arch=('any')
url="https://github.com/rbarrois/python-semanticversion"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-$pkgver.tar.gz")
sha256sums=('33018ab2807ba395c418b4633993a7572b8a4b3e924823f5828788023b3c9b30')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
