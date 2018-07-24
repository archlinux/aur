# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=holoviews
pkgname=python-$_pkgname
pkgver=1.10.7
pkgrel=1
pkgdesc="Stop plotting your data - annotate your data and let it visualize itself."
arch=("any")
url="http://holoviews.org"
license=('BSD')
depends=('python-numpy' 'python-param')
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/a8/98/1bca6211f1e9a08aa61937b40061b83b61fb10f1bbf7452f779aa7ade3e0/holoviews-1.10.7.tar.gz')
sha256sums=('4d1753ae27486e324e2ee5d6a239bf8cc4a9acafecc0e38cb60a476bd7b4abc9')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
