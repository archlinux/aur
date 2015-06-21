# Maintainer: clu

pkgname=python2-astlib
pkgver=0.8.0
pkgrel=1
pkgdesc="Python astronomy modules"
arch=('i686' 'x86_64')
url="http://astlib.sourceforge.net"
license=("LGPL2.1")
depends=('python2' 'python2-astropy>=0.4' 'python2-numpy>=1.3.0' 'python2-scipy>=0.7.1' 'python2-matplotlib>=0.98.3') 
makedepends=('python2' 'python2-distribute')
source=("http://downloads.sourceforge.net/project/astlib/astlib/$pkgver/astLib-$pkgver.tar.gz")
sha1sums=('cbd999f87773002e471bd165927c2ee124a5515f')

package() {
  cd $srcdir/astLib-$pkgver
  python2 setup.py install --root=$pkgdir --prefix=/usr --optimize=1
}
