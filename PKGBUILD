# $Id: PKGBUILD 226630 2017-05-03 13:48:02Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=bwidget
pkgver=1.9.10
pkgrel=1
pkgdesc="A suite of megawidgets for Tk"
arch=('any')
url="http://tcl.activestate.com/software/tcllib/"
license=('GPL')
depends=('bash' 'tcl')
source=("http://downloads.sourceforge.net/project/tcllib/BWidget/$pkgver/bwidget-$pkgver.tar.gz")
sha256sums=('26c312204bd9d065001e95fcac8fed0f63cb44e746204853f21813ac62aeb408')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/usr/lib/tcl8.6
  cp -r bwidget-$pkgver "${pkgdir}"/usr/lib/tcl8.6/
}
