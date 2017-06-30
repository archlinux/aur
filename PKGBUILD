# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-stylus
pkgver=1.1.0
pkgrel=1
pkgdesc='Easily install themes and skins for many popular sites'
url=https://add0n.com/stylus.html
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/814814/stylus_beta-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha512sums=('3e5a3f50e013d51b0f976730331693c11c0756d481c210cc599b185f011877548f5f5e2b8b9a99ea2e3ed0d883af8be449313b5a4b35752a4b8f066322a0fb40')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}.xpi
}

# vim:set ts=2 sw=2 et:
