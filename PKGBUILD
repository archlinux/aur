# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-stylus
pkgver=1.4.12
pkgrel=1
pkgdesc='Easily install themes and skins for many popular sites'
url=https://add0n.com/stylus.html
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/814814/stylus-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('d9ddb51a38ea1c196edd48d09499e5b1f1b56cf752223fc446497a41b364c5bf')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}.xpi
}

# vim:set ts=2 sw=2 et:
