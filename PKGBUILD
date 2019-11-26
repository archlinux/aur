# Maintainer: Michael Borders <michael.a.borders@gmail.com>

pkgname=python-textfsm
_pkgname=textfsm
pkgver=1.1.1
_pkgver="v${pkgver}"
pkgrel=2
pkgdesc="Python module for parsing semi-structured text into python tables."
arch=('any')
url="https://github.com/google/textfsm"
license=('Apache')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("${url}/archive/${_pkgver}.tar.gz")
sha256sums=('9299d54544b679ef2a477c9256ec5e906c649f8f79593b71d2bb56e1c96e6601')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
