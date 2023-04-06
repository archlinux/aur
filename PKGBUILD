# Maintainer: Alexander F Rødseth <rodseth@gmail.com>

pkgname=python-clint
pkgver=0.5.1
pkgrel=12
pkgdesc='Module for developing command line applications'
arch=('any')
url='https://pypi.python.org/pypi/clint/'
license=('custom:ISC')
depends=('python')
source=("https://pypi.python.org/packages/source/c/clint/clint-$pkgver.tar.gz")
sha256sums=('05224c32b1075563d0b16d0015faaf9da43aa214e4a2140e51f08789e7a4c5aa')

package() {
  cd "clint-$pkgver"

  python setup.py install \
    --install-data="/usr/share/doc/$pkgname" --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
