# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=holoviews
pkgname=python-$_pkgname
pkgver=1.9.0
pkgrel=1
pkgdesc="Stop plotting your data - annotate your data and let it visualize itself."
arch=("any")
url="http://holoviews.org"
license=('BSD')
depends=('python-numpy' 'python-param')
options=(!emptydirs)
source=("https://pypi.python.org/packages/a6/a5/5f00e48ce213c0e404b057a094a0b53f49a77b673b89eba9a10fd2c4fb61/holoviews-1.9.0.tar.gz")
md5sums=('96f8bde3260044338f9c937b16bc8feb')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
