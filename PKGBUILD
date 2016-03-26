# Submitter: Germán Osella Massa <gosella@gmail.com>

pkgname=('autopython')
pkgver=0.3
pkgrel=1
pkgdesc='Autoscripting for Python 3'
arch=('any')
url='https://pypi.python.org/pypi/autopython'
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/a/autopython/autopython-$pkgver.tar.gz")
md5sums=('6e87bf46eb41e972653636dcdcdd1b8f')

package() {
  cd "$srcdir/autopython-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
