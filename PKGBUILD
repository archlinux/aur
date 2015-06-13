# Maintainer: Christian Dersch <chrisdersch@gmail.com>
pkgname=python2-pyraf
pkgver=2.1.7
pkgrel=1
pkgdesc="Python interface for IRAF"
arch=('i686' 'x86_64')
depends=('python2' 'python2-stscitools' 'iraf-bin' 'python2-matplotlib' 'python2-numpy' 'python2-urwid' 'tcl' 'tk')
optdepends=('ipython2')
url="http://www.stsci.edu/institute/software_hardware/pyraf/"
source=(http://stsdas.stsci.edu/download/pyraf/pyraf-$pkgver.tar.gz)
license=('BSD')
md5sums=('72c7529de63bd1d4cfe016e5253d0b8f')

package() {
  cd $srcdir/pyraf-$pkgver
  python2 setup.py install --root $pkgdir
}
