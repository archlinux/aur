# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=vieb
pkgver=4.0.0
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
sha256sums=('694a7f2642e841d017361c300f208dbc96785b1a8ae13a925aef559d141d36c9')

package() {
	cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"
}
# vim:set ts=2 sw=2 et:
