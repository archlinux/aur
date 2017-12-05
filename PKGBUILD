# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-stylus
pkgver=1.1.7.3
pkgrel=1
pkgdesc='Easily install themes and skins for many popular sites'
url=https://add0n.com/stylus.html
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/814814/stylus_beta-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('ad1b45ebd87f11f8ac0e3ea2a05aa6f66e61e79d99729885aa2181a922b4f585')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}.xpi
}

# vim:set ts=2 sw=2 et:
