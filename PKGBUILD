# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=holoviews
pkgname=python-$_pkgname
pkgver=1.13.3
pkgrel=1
pkgdesc="Stop plotting your data - annotate your data and let it visualize itself."
arch=("any")
url="http://holoviews.org"
license=('BSD')
depends=('python-numpy' 'python-param' 'python-pandas' 'python-panel' 'python-pyviz_comms')
makedepends=('python-pyct')
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/9a/1c/842589f5c2614f5ab799fe7ee44f0629e31efe0fa1bd4a2c3b4110174b87/holoviews-1.13.3.tar.gz')
sha256sums=('e6753651a8598f21fc2c20e8456865ecec276cfea1519182a76d957506727934')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
