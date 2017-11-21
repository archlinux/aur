# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-stylus
pkgver=1.1.6.1
pkgrel=1
pkgdesc='Easily install themes and skins for many popular sites'
url=https://add0n.com/stylus.html
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/814814/stylus_beta-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('b21565a539ca4637a05b76c8b29625faf5e29a0ed90f22ba8aede318e105dbae')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}.xpi
}

# vim:set ts=2 sw=2 et:
