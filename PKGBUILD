# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=vieb
pkgver=3.4.0
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
sha256sums=('0945203f50a9d5b03723141b5b20f5f79639eeb8394b8637ee4c91e83afab8a6')

package() {
	cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"
}
# vim:set ts=2 sw=2 et:
