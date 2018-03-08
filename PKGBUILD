# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-stylus
pkgver=1.3.4
pkgrel=1
pkgdesc='Easily install themes and skins for many popular sites'
url=https://add0n.com/stylus.html
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/814814/stylus-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('86d1f1a41eef26eb3eeebad8d8677c3dd07fa7866e63de8863c7e0a0c9fe426a')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}.xpi
}

# vim:set ts=2 sw=2 et:
