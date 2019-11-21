# Maintainer: Viachaslau Khalikin <khalikin'at'yandex'dot'by>

pkgname=icecat-ublock-origin
pkgver=1.24.1b3
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL3')
groups=('icecat-addons')
source=("https://github.com/gorhill/uBlock/releases/download/${pkgver}/uBlock0_${pkgver}.firefox.signed.xpi")
noextract=("${source##*/}")
sha256sums=('22fa34d9d407404f26272b73d0f6892e666cd0a1e5ae463176a49773cebeedd2')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/icecat/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
