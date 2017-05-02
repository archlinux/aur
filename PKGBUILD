# Contributor: Erhan SAHIN < erhan@ssahin.net >
# Maintainer: Will Price <will.price94@gmail.com>

pkgname=python2-semantic-version
pkgver=2.6.0
pkgrel=1
pkgdesc="Semantic version comparison for Python"
arch=('any')
url="https://github.com/rbarrois/python-semanticversion"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/72/83/f76958017f3094b072d8e3a72d25c3ed65f754cc607fdb6a7b33d84ab1d5/semantic_version-2.6.0.tar.gz")
md5sums=('4388a5df93e4dbe7b48767b3694bb761')

package() {
  cd "$srcdir/semantic_version-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
