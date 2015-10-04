# Submitter: Germán Osella Massa <gosella@gmail.com>

pkgname=('python-mpld3' 'python2-mpld3')
pkgver=0.2
pkgrel=1
pkgdesc='D3 Viewer for Matplotlib'
arch=('any')
url='http://mpld3.github.io/'
license=('BSD 3-clause')
makedepends=('python-setuptools' 'python2-setuptools')
source=("http://pypi.python.org/packages/source/m/mpld3/mpld3-$pkgver.tar.gz")
md5sums=('266f4e51a094f8ff1aaf7e2018f763b4')

package_python-mpld3() {
  depends=('python' 'python-matplotlib' 'python-jinja')

  cd "$srcdir/mpld3-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-mpld3() {
  depends=('python2' 'python2-matplotlib' 'python2-jinja')

  cd "$srcdir/mpld3-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
