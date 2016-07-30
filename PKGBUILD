# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=holoviews
pkgname=python-$_pkgname
pkgver=1.6.1
pkgrel=1
pkgdesc="Data visualization via annotation"
arch=("any")
url="https://ioam.github.io/holoviews"
license=('BSD')
depends=('python-numpy' 'python-param')
options=(!emptydirs)
source=("https://pypi.python.org/packages/81/da/711264f4ca290b2af42634f65d3909aa708a77293c48d3826cc5cd5f1bca/holoviews-1.6.1.tar.gz")
md5sums=('662a4fbe8de6e9b2cf9a7870695ce073')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
