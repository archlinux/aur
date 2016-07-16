# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=holoviews
pkgname=python-$_pkgname
pkgver=1.6.0
pkgrel=1
pkgdesc="Data visualization via annotation"
arch=("any")
url="https://ioam.github.io/holoviews"
license=('BSD')
depends=('python-numpy' 'python-param')
options=(!emptydirs)
source=("https://pypi.python.org/packages/eb/ab/2e2ba587a8d85ce87e330f3f37bb2eae527733243f599d87f7545faf0848/holoviews-1.6.0.tar.gz")
md5sums=('13425bb525aae7db6921dcad2593fd1d')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
