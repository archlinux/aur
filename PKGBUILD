# Maintainer: Viachaslau Khalikin <khalikin'at'yandex>

pkgname=icecat-ublock-origin
pkgver=1.26.0
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL3')
groups=('icecat-addons')
source=("https://github.com/gorhill/uBlock/releases/download/${pkgver}/uBlock0_${pkgver}.firefox.xpi")
noextract=("${source##*/}")
sha256sums=('53cb688318a76549c84e6a3b813610c1e5ddc31a6475e41808ddbf4c20f33183')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/icecat/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ft=sh ts=2 sw=2 et:
