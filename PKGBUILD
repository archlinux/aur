# Maintainer: ngld <ngld@tproxy.de>
_pyname=semantic_version
pkgname=python-semantic-version
pkgver=2.6.0
pkgrel=1
pkgdesc="A library implementing the 'SemVer' scheme."
arch=('any')
url="https://github.com/rbarrois/python-semanticversion"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/72/83/f76958017f3094b072d8e3a72d25c3ed65f754cc607fdb6a7b33d84ab1d5/semantic_version-2.6.0.tar.gz")
sha256sums=('2a4328680073e9b243667b201119772aefc5fc63ae32398d6afafff07c4f54c0')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
