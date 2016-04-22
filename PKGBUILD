# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=python2-mercurial_extension_utils
pkgver=1.2.0
pkgrel=1
pkgdesc="Mercurial Extension Utils"
arch=('any')
url="https://pypi.python.org/pypi/mercurial_extension_utils"
makedepends=('python2-distribute')
depends=('python2')
license=('BSD')
source=(https://pypi.python.org/packages/source/m/mercurial_extension_utils/mercurial_extension_utils-$pkgver.tar.gz)
md5sums=('16a8cced2c422eb9ae506a5da3479bf8')

package() {
  cd $srcdir/mercurial_extension_utils-$pkgver
  python2 setup.py install --root=$pkgdir || return 1
}
