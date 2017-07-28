# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=python-fuzzyfinder
_name=fuzzyfinder
pkgver=1.0.0
pkgrel=1
license=('BSD')
pkgdesc='Fuzzy Finder implemented in Python. Matches partial string entries from a list of strings.'
makedepends=('python-setuptools')
depends=('python')
arch=('any')
url='https://github.com/amjith/fuzzyfinder'
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('691e48e2f8911f366a1de4eddcff34a212081bcc55999d89f2332941149c8087')

package() {
  cd "$srcdir/$_name-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}
