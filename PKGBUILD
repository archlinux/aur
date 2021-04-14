# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=vieb
pkgver=4.4.0
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
sha512sums=('5a215daae5998a7772d4ad512b462b4ea8e40d70a1a77634343e97963d92d5dd9e60e689edee0211e91ba8b2d6493f31d9644dc5cf2269e1511c38f1a75c5566')

package() {
	cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"
}
# vim:set ts=2 sw=2 et:
