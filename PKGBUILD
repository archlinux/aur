# Maintainer: XavierCLL
# Contributor: Alexander <rodseth@gmail.com>

pkgname=python2-clint
pkgver=0.5.1
pkgrel=1
pkgdesc="Module for developing commandline applications"
arch=('any')
url="http://pypi.python.org/pypi/clint/"
license=('ISC')
depends=('python2')
conflicts=('python2-clint-git')
source=("http://pypi.python.org/packages/source/c/clint/clint-$pkgver.tar.gz")
sha256sums=('05224c32b1075563d0b16d0015faaf9da43aa214e4a2140e51f08789e7a4c5aa')

package() {
  cd "$srcdir/clint-$pkgver"

  python2 setup.py install --install-data="/usr/share/doc/$pkgname" \
    --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


