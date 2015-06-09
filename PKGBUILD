# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# vercheck-pkgbuild: auto
# vercheck-ppa: name=${pkgname}, url=ppa:bhdouglass/indicator-remindor, native

pkgname=remindor-qt
pkgver=14.06
_ppa_rel=0ubuntu1~trusty
pkgrel=2
pkgdesc="Schedule reminders easily from an indicator"
arch=(any)
url="http://bhdouglass.tk/remindor/qt/"
license=(GPL)
depends=(phonon-qt4 python2-notify python2-pyside shiboken remindor-common)
makedepends=(python2-distutils-extra)
install=remindor-qt.install
source=("http://ppa.launchpad.net/bhdouglass/indicator-remindor/ubuntu/pool/main/r/remindor-qt/remindor-qt_${pkgver}-${_ppa_rel}.tar.gz")
sha512sums=('f6b6e9ae13b8cf804a321cfde2be00cf4074f9a2cf2b2cac375eefe21fcc842a9708d2577a8a7a9cc0c4e6881fa8f2d3f7b8e3025b126fa805e6af253a73201c')

package() {
  cd "${pkgname}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
