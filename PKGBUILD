# Maintainer: Viachaslau Khalikin <khalikin'at'yandex>

pkgname=icecat-ublock-origin
pkgver=1.27.0
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL3')
groups=('icecat-addons')
source=("https://github.com/gorhill/uBlock/releases/download/${pkgver}/uBlock0_${pkgver}.firefox.xpi")
noextract=("${source##*/}")
sha256sums=('88e998927c9c160b2471fca7382b0e1a00c69e3e904e1445944eabf6a1b6b53e')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/icecat/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ft=sh ts=2 sw=2 et:
