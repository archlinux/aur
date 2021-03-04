# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=vieb
pkgver=4.1.0
pkgrel=1
pkgdesc="Vim Inspired Electron Browser - Vim bindings for the web by design"
arch=('x86_64')
url="https://vieb.dev"
license=('GPL3')
depends=('c-ares'
  'ffmpeg'
  'gtk3'
  'http-parser'
  'libevent'
  'libvpx'
  'libxslt'
  'libxss'
  'minizip'
  'nss'
  're2'
  'snappy'
  'libnotify')
provides=('vieb')
install="${pkgname}.install"
source=("https://github.com/Jelmerro/Vieb/releases/download/${pkgver}/${pkgname}-${pkgver}.pacman")
sha512sums=('22786e65e5cfe5fb71454810122c4a35634c59cf00b85956a60d8377bbc710c74634ca21443f7e228b48a1b35ca1ab2a2673fae91be3abce058969b44a71a650')

package() {
	cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"
}
# vim:set ts=2 sw=2 et:
