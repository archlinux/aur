# Maintainer: John Lane <archlinux at jelmail dot com>
# Contributor: Rich Li <rich@dranek.com>

pkgname=pyzor
pkgver=1.0.0
pkgrel=1
pkgdesc="Detect and block spam using identifying digests of messages."
arch=('any')
url="http://pyzor.sourceforge.net/"
license=('GPL')
makedepends=('python2-setuptools')
depends=('python2')
source=(https://pypi.python.org/packages/source/p/pyzor/${pkgname}-${pkgver}.tar.gz)
sha256sums=('10ea114bdee2eee5edd6afe8eeddaaf605620445977ae019a3e9b1cbb6bc3b27')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
