# Maintainer: Viachaslau Khalikin <khalikin'at'yandex>

pkgname=icecat-ublock-origin
pkgver=1.25.2
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL3')
groups=('icecat-addons')
source=("https://github.com/gorhill/uBlock/releases/download/${pkgver}/uBlock0_${pkgver}.firefox.xpi")
noextract=("${source##*/}")
sha256sums=('ded90038b507c6201547be2ccebd5e69ee641eaa727bb61270d252b353f08191')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/icecat/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ft=sh ts=2 sw=2 et:
