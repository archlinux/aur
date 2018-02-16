# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-vimium
pkgver=1.63
pkgrel=1
pkgdesc='Provides keyboard shortcuts for navigation and control in the spirit of Vim'
url=https://github.com/philc/vimium
arch=('any')
license=('MIT')
source=("https://addons.cdn.mozilla.net/user-media/addons/808538/vimium_ff-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('cdde98acfb5ef36fd4527afb8480d0b7f9b78c3d2c4123a1b2106683b1c436e3')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{d7742d87-e61d-4b78-b8a1-b469842139fa}.xpi
}

# vim:set ts=2 sw=2 et:
