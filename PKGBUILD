# Maintainer: Nils Czernia <nils at czserver.de>
pkgname=python2-ami
pkgver=0.0.2
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/ettoreleandrotognoli/python-ami/"
depends=('')
conflicts=()
install=
source=(https://pypi.python.org/packages/source/a/asterisk-ami/asterisk-ami-${pkgver}.tar.gz)

sha256sums=('484a493856c5c5437fdad762a7f53a39b8cc6d019aa967e7b1cdbb9e605cdfd8')


package() {
  cd "$srcdir/asterisk-ami-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

