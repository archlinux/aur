pkgname=python-better-bencode
_pkgname=better-bencode
pkgver=0.2.1
pkgrel=1
pkgdesc="Fast, standard compliant Bencode serialization"
arch=('any')
options=('!strip')
url="https://github.com/kosqx/better-bencode"
license=('BSD')
depends=('')
makedepends=('python-setuptools')
provides=('magnetico')
source=("https://pypi.python.org/packages/0e/c2/a9060ea075dadc97d3933286166c821dfc60b8c5f7f28120e958cb484200/better-bencode-0.2.1.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname-$pkgver/"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
