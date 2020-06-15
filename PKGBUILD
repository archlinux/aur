# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=holoviews
pkgname=python-$_pkgname
pkgver=1.13.2
pkgrel=1
pkgdesc="Stop plotting your data - annotate your data and let it visualize itself."
arch=("any")
url="http://holoviews.org"
license=('BSD')
depends=('python-numpy' 'python-param' 'python-pyviz_comms')
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/9b/ad/aec5011cc02803e50b11c4967b1b2c2fba8c4e5e0f6f2d9f96db3e29cc3b/holoviews-1.13.2.tar.gz')
sha256sums=('cf2dd426cdc08bf2ca669268ca0432634574429e5b143314ee06ad88c5382802')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
