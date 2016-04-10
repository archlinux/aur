# Maintainer: Marco Pompili <aur@emarcs.org>
# Contributor: Christian Dersch <chrisdersch@gmail.com>

pkgname=python2-pyraf
pkgver=2.1.10
pkgrel=1
pkgdesc="Python interface for IRAF"
arch=('i686' 'x86_64')
depends=('python2' 'python2-stscitools' 'iraf-bin' 'python2-matplotlib' 'python2-numpy' 'python2-urwid' 'tcl' 'tk')
optdepends=('ipython2')
url="http://www.stsci.edu/institute/software_hardware/pyraf/"
source=(http://stsdas.stsci.edu/download/pyraf/pyraf-$pkgver.tar.gz)
license=('BSD')
sha256sums=('040085e0de7d509701bd8aaa9d2abf16f7c3a5db655a2a78a43252c143b20199')

package() {
  cd $srcdir/pyraf-$pkgver
  python2 setup.py install --root $pkgdir
}
