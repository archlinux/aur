# Maintainer: Viachaslau Khalikin <khalikin'at'yandex'dot'by>

pkgname=icecat-ublock-origin
pkgver=1.24.3b7
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL3')
groups=('icecat-addons')
source=("https://github.com/gorhill/uBlock/releases/download/${pkgver}/uBlock0_${pkgver}.firefox.signed.xpi")
noextract=("${source##*/}")
sha256sums=('6b0dd1b8fd25197b9f453b67e8788309c87fd52acb19097bcbbd189362b5a84d')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/icecat/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
