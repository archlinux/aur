# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Matthew Lawson <mmlawson@ucdavis.edu>
pkgname=python-pyraf
pkgver=2.1.8
pkgrel=1
pkgdesc="Python interface for IRAF"
arch=('i686' 'x86_64')
depends=('python' 'iraf-bin' 'python-stscitools' 'python-matplotlib' 'python-numpy' 'python-urwid' 'tcl' 'tk')
optdepends=('ipython')
url="http://www.stsci.edu/institute/software_hardware/pyraf/"
source=(https://pypi.python.org/packages/source/p/pyraf/pyraf-$pkgver.tgz)
license=('BSD')

md5sums=('b2daa5a0e967810d1ac3583419f26b43')

package() {
  cd $srcdir/pyraf-$pkgver
  python setup.py install --root $pkgdir
}
