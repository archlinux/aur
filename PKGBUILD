# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=vieb
pkgver=4.2.1
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
install="${pkgname}.install"
source=("https://github.com/Jelmerro/Vieb/releases/download/${pkgver}/${pkgname}-${pkgver}.pacman")
sha512sums=('94abff9755fbfb1d9ce5c12ebbc4fb0786593f460044ad86b5e4c056426b75f2aa4e9a1ae6169e76a98ecd3edcce980e2ecc5352a530ef6cde6675848faa70e2')

package() {
	cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"
}
# vim:set ts=2 sw=2 et:
