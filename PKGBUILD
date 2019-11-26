# Maintainer: Michael Borders <michael.a.borders@gmail.com>

pkgname=python-yamlordereddictloader
pkgver=0.4.0
pkgrel=2
pkgdesc="(DEPRECATED) YAML loader and dumper for PyYAML allowing to keep keys order."
arch=('any')
url="https://github.com/fmenabe/python-yamlordereddictloader"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('e4bfa840def98eb7878e49cba35361aea24a52cafd1f029845179e9100a1040d')

package(){
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
