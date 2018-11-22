# Maintainer: Amos Onn <amosonn at gmail dot com>
pkgbase=python-dpms
pkgname=('python2-dpms')
_pkgname=python-dpms
_pkgver=688e645
pkgver=r4.$_pkgver
pkgrel=1
pkgdesc="Python Bindings to DPMS X11 extension"
arch=('any')
url="https://github.com/dirjud/python-dpms"
license=("UNKNOWN")
depends=('libx11' 'libxext')
source=(https://codeload.github.com/dirjud/python-dpms/tar.gz/$_pkgver)
sha256sums=('caee5726af9bf35165b298091f3defc088c92f3fbbd206659de2d166126afece')

prepare() {
  cp -a $_pkgname-$_pkgver{,-py2}
}

#package_python-dpms() {
  #depends+=('python')
  #cd $srcdir/$_pkgname-$_pkgver
  #python setup.py install --root=$pkgdir || return 1
  ##install -d $pkgdir/usr/share/licenses/$pkgname
  ##install LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/COPYING
#}

package_python2-dpms() {
  depends+=('python2')
  cd $srcdir/$_pkgname-$_pkgver-py2
  python2 setup.py install --root=$pkgdir || return 1
  #install -d $pkgdir/usr/share/licenses/$pkgname
  #install LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/COPYING
}
