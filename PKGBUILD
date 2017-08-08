# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-stylus
pkgver=1.1.2.1
pkgrel=1
pkgdesc='Easily install themes and skins for many popular sites'
url=https://add0n.com/stylus.html
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/814814/stylus_beta-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha512sums=('4f59b4fbc4514bce5c91da93a78d50aef20705ea58ffe025b31649cb9de47e9c5d8d4e0b20f13bddf5d986e034dd25fb2590589821a7c7dd877ed94e636675cd')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}.xpi
}

# vim:set ts=2 sw=2 et:
