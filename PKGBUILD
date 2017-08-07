# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Matthew Lawson <mmlawson@ucdavis.edu>
pkgname=python-pyraf
pkgver=2.1.14
pkgrel=1
pkgdesc="Python interface for IRAF"
arch=('i686' 'x86_64')
depends=('python' 'iraf-bin' 'python-stscitools' 'python-matplotlib' 'python-numpy' 'python-urwid' 'tcl' 'tk')
optdepends=('ipython')
url="http://www.stsci.edu/institute/software_hardware/pyraf/"
source=("https://files.pythonhosted.org/packages/source/p/pyraf/pyraf-${pkgver}.tar.gz")
license=('BSD')

md5sums=('c45bbfd016b43d7af6f4c9fe7e0603e0')

package() {
  cd $srcdir/pyraf-$pkgver
  python setup.py install --root $pkgdir
}
