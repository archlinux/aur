# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-vimium
pkgver=1.61.1
pkgrel=1
pkgdesc='Provides keyboard shortcuts for navigation and control in the spirit of Vim'
url=https://github.com/philc/vimium
arch=('any')
license=('MIT')
source=("https://addons.cdn.mozilla.net/user-media/addons/808538/vimium_ff-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('55af329f7cb062cbe0bdfe51838fec18555da8743187deb60dad73b8dcc90c8b')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{d7742d87-e61d-4b78-b8a1-b469842139fa}.xpi
}

# vim:set ts=2 sw=2 et:
