# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-stylus
pkgver=1.1.3.1
pkgrel=1
pkgdesc='Easily install themes and skins for many popular sites'
url=https://add0n.com/stylus.html
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/814814/stylus_beta-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha512sums=('c4aa80e3c25797fa5656f14cb5628df39412f81ead324cc50826acb441b6129dc6bd1e5e1006a8dc12893c7c4be65721ffaf8985ea60566bdf706badb341ceaa')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}.xpi
}

# vim:set ts=2 sw=2 et:
