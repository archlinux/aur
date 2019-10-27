# Maintainer: Viachaslau Khalikin <khalikin'at'yandex'dot'by>

pkgname=icecat-ublock-origin
pkgver=1.23.1b3
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL3')
groups=('icecat-addons')
source=("https://github.com/gorhill/uBlock/releases/download/${pkgver}/uBlock0_${pkgver}.firefox.signed.xpi")
noextract=("${source##*/}")
sha256sums=('e062f70f0336357b0f73046aefd17167e61afaeb62d28e1179380fb5aeec5c36')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/icecat/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
