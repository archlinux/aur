# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-vimium
pkgver=1.63.2
pkgrel=1
pkgdesc='Provides keyboard shortcuts for navigation and control in the spirit of Vim'
url=https://github.com/philc/vimium
arch=('any')
license=('MIT')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/808538/vimium_ff-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('271d4b301912c0bb98f5b7b3f125f19276bc2e093ef9c1f4fb3cb652271ea133')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{d7742d87-e61d-4b78-b8a1-b469842139fa}.xpi
}

# vim:set ts=2 sw=2 et:
