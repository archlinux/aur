# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=vieb
pkgver=3.2.0
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
				 'libnotify'
				 'libappindicator-gtk3')
provides=('vieb')
install="${pkgname}.install"
source=("https://github.com/Jelmerro/Vieb/releases/download/${pkgver}/${pkgname}-${pkgver}.pacman")
sha256sums=('173b972d76c05c11f11a3c0884221cb351c52d88d5d293b64e63e6720f48694c')

package() {
	cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"
}
# vim:set ts=2 sw=2 et:
