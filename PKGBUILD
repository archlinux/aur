# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=holoviews
pkgname=python-$_pkgname
pkgver=1.5.0
pkgrel=1
pkgdesc="Data visualization via annotation"
arch=("any")
url="https://ioam.github.io/holoviews"
license=('BSD')
depends=('python-numpy' 'python-param')
options=(!emptydirs)
source=("https://pypi.python.org/packages/9f/33/5bbab856083a39da38c8e3a9da0306c1a2f765fd4a37f2cb1eaf3c810948/holoviews-1.5.0.zip")
md5sums=('531209948c44dfe92869a9422ba9a7d4')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
