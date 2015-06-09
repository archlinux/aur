pkgname=python2-rtmpy
pkgver=0.1.1
pkgrel=1
pkgdesc="A Python module that provides RTMP support"
depends=('python2' 'python2-pyamf' 'twisted' 'zope-interface')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/R/RTMPy/RTMPy-${pkgver}.tar.gz")
url="https://github.com/hydralabs/rtmpy"
license=('LGPL2.1')
arch=('i686' 'x86_64')
md5sums=('c1e3e2a93b9174b0799007af15989f3a')

package() {
  cd "$srcdir"/RTMPy-$pkgver
  python2 setup.py install --root "${pkgdir}"
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/RTMPy-$pkgver/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname
}
