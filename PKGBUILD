# Maintainer: Christopher Woodruff <cswoodruff@gmail.com>

pkgname=python2-pyyaml
pkgver=3.11
pkgrel=1
pkgdesc="YAML parser and emitter for Python"
arch=('any')
depends=('libyaml' 'python')
makedepends=('python-setuptools')
url="http://pyyaml.org/wiki/PyYAML"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/P/PyYAML/PyYAML-$pkgver.tar.gz)
md5sums=('f50e08ef0fe55178479d3a618efe21db')
sha256sums=('c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8')

package() {
  cd "$srcdir/PyYAML-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
