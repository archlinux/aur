# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Matthew Lawson <mmlawson@ucdavis.edu>
pkgname=python-pyraf
pkgver=2.1.10
pkgrel=1
pkgdesc="Python interface for IRAF"
arch=('i686' 'x86_64')
depends=('python' 'iraf-bin' 'python-stscitools' 'python-matplotlib' 'python-numpy' 'python-urwid' 'tcl' 'tk')
optdepends=('ipython')
url="http://www.stsci.edu/institute/software_hardware/pyraf/"
source=(https://pypi.python.org/packages/source/p/pyraf/pyraf-$pkgver.tar.gz)
license=('BSD')

md5sums=('221aed9d6af6377118ffd22f544e7f4b')

package() {
  cd $srcdir/pyraf-$pkgver
  python setup.py install --root $pkgdir
}
