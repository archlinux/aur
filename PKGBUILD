# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
_pkgname=mercurial_extension_utils
pkgname=python2-$_pkgname
pkgver=1.3.0
pkgrel=1
pkgdesc="Mercurial Extension Utils"
arch=('any')
url="https://bitbucket.org/Mekk/mercurial-extension_utils"
makedepends=('python2-distribute')
depends=('python2')
license=('BSD')
source=(https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('f12fb6df9570e9ccdfe6662eb63a1f31')

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir || return 1
}
