# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# vercheck-pkgbuild: auto
# vercheck-ppa: name=${pkgname}, url=ppa:bhdouglass/indicator-remindor, native

pkgname=remindor-qt
pkgver=15.06
_ppa_rel=0ubuntu1~vivid
pkgrel=2
pkgdesc="Schedule reminders easily from an indicator"
arch=(any)
url="http://bhdouglass.tk/remindor/qt/"
license=(GPL)
depends=(phonon-qt4 python2-notify python2-pyside shiboken remindor-common)
makedepends=(python2-distutils-extra)
install=remindor-qt.install
source=("http://ppa.launchpad.net/bhdouglass/indicator-remindor/ubuntu/pool/main/r/remindor-qt/remindor-qt_${pkgver}-${_ppa_rel}.tar.gz")
sha512sums=('d41406151b22bb94a30c027a5aa38b2ebd781f73499925f10bf8d4ebb1c215f988e55eb762caa857ffa1e5e3533baf08522f68cf814e084f4a631adff38000d2')

package() {
  cd "${pkgname}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
