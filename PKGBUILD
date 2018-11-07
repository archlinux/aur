# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-stylus
pkgver=1.4.23
pkgrel=1
pkgdesc='Easily install themes and skins for many popular sites'
url=https://add0n.com/stylus.html
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/814814/stylus-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('eaac3f5c4dcc9f10fb7b774f6aeef4e294ece2659784ae70d5b9e78afeaec197')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}.xpi
}

# vim:set ts=2 sw=2 et:
