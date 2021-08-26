# Maintainer: 7k5x<7k5xlp0onfire@gmail.com>
pkgname=zoom-libnimf
pkgver=1.3.0
pkgrel=1
pkgdesc="Nimf library for zoom multilingual input."
arch=('x86_64')
url="https://github.com/hamonikr/nimf"
license=('LGPL3')
depends=('nimf' 'zoom')
source=("https://github.com/hamonikr/nimf/releases/download/1.3.0/nimf_1.3.0hamonikr40.4_amd64.deb")
sha256sums=("b109fd7613e1014bc9f5750a47474ff6b0023fc9a5da0b603ad421bb96c1f11d")

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C "${srcdir}/"
  mkdir ${pkgdir}/opt
  mkdir ${pkgdir}/opt/zoom
  mkdir ${pkgdir}/opt/zoom/platforminputcontexts
   cp ${srcdir}/usr/lib/x86_64-linux-gnu/qt5/plugins/platforminputcontexts/libqt5im-nimf.so ${pkgdir}/opt/zoom/platforminputcontexts/libqt5im-nimf.so
}
