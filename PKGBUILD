# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python-hpilo
pkgname=python2-backports.lzma
_pkgname=backports.lzma
pkgver=0.0.3
pkgrel=1
pkgdesc="Backport of Python 3.3's 'lzma' module for XZ/LZMA compressed files."
arch=('any')
url='https://pypi.python.org/pypi/backports.lzma'
license=('unknown')
depends=('python2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/b/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('c3d109746aefa86268e500c07d7e8e0f')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
