# Maintainer: Viachaslau Khalikin <khalikin'at'yandex>

pkgname=icecat-ublock-origin
pkgver=1.27.10
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL3')
groups=('icecat-addons')
source=("https://github.com/gorhill/uBlock/releases/download/${pkgver}/uBlock0_${pkgver}.firefox.xpi")
noextract=("${source##*/}")
sha256sums=('673c8b617124f863f60be49b15c89d050028cbcf6f8430e0ef31625b739360a5')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/icecat/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ft=sh ts=2 sw=2 et:
