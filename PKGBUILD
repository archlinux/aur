# Maintainer: Christoph Pohl <christophpohl@gmx.com>
pkgname=python-ahkab
pkgver=0.18
pkgrel=1
pkgdesc="A SPICE-like electronic circuit simulator written in Python"
arch=('any')
url="https://ahkab.github.io/ahkab/"
license=('GPL2')
depends=('python-numpy' 'python-scipy' 'python-sympy' 'python-tabulate')
optdepends=('python-matplotlib: plotting')
source=("ahkab-$pkgver.tar.gz::https://github.com/ahkab/ahkab/archive/v$pkgver.tar.gz")
md5sums=('9f82ed50cf654e87437713a87ced4f1f')

package() {
  cd "$srcdir/ahkab-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
