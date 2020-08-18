# Maintainer: Viachaslau Khalikin <khalikin'at'protonmail>

pkgname=icecat-ublock-origin
pkgver=1.29.0
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL3')
groups=('icecat-addons')
source=("https://github.com/gorhill/uBlock/releases/download/${pkgver}/uBlock0_${pkgver}.firefox.xpi")
noextract=("${source##*/}")
sha256sums=('b309f401704d127a775bc128829c7a3fc2865b36c9f5fcf6b4e28ae3b9abcbd8')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/icecat/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ft=sh ts=2 sw=2 et:
