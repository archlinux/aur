# Maintainer: Miguel de Val-Borro <miguel . deval @ gmail . com>
# Contributor: Matthew Lawson <mmlawson@ucdavis.edu>
pkgname=python-pyraf
pkgver=2.1.15
pkgrel=1
pkgdesc="Python interface for IRAF"
arch=('i686' 'x86_64')
depends=('python' 'iraf-bin' 'python-stscitools' 'python-matplotlib' 'python-numpy' 'python-urwid' 'tcl' 'tk')
optdepends=('ipython')
url="https://github.com/spacetelescope/pyraf"
source=("https://files.pythonhosted.org/packages/source/p/pyraf/pyraf-${pkgver}.tar.gz")
license=('BSD')
md5sums=('c737b29d3c81cb14977b3c18b75d35ba')

package() {
  cd $srcdir/pyraf-$pkgver
  python setup.py install --root $pkgdir
}
