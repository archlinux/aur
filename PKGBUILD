# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=holoviews
pkgname=python-$_pkgname
pkgver=1.12.2
pkgrel=1
pkgdesc="Stop plotting your data - annotate your data and let it visualize itself."
arch=("any")
url="http://holoviews.org"
license=('BSD')
depends=('python-numpy' 'python-param')
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/4a/67/1b981e3ad6cf346787f9a61a616a3c58da5d63608ae90932ac5b07746eb1/holoviews-1.12.2.tar.gz')
sha256sums=('62004df8b60dff462b0e0b85506a357ba523f4b172819a2e8505992f95759444')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
