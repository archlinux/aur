# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=holoviews
pkgname=python-$_pkgname
pkgver=1.4.0
pkgrel=1
pkgdesc="Data visualization via annotation"
arch=("any")
url="https://ioam.github.io/holoviews"
license=('BSD')
depends=('python-numpy' 'python-param')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/h/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('e882c084b1e69022e53a4d40dd4b52c5')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
