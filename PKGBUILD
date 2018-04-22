# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=holoviews
pkgname=python-$_pkgname
pkgver=1.10.1
pkgrel=1
pkgdesc="Stop plotting your data - annotate your data and let it visualize itself."
arch=("any")
url="http://holoviews.org"
license=('BSD')
depends=('python-numpy' 'python-param')
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/70/93/064e06755a84d43c380588e845fabae40e53742aaa40fa0aa5d1f674f259/holoviews-1.10.1.tar.gz')
sha256sums=('3fa11d143ba9a60802686af23942848067181771c7558a369b3e1476ad54ba9f')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
