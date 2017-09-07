# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-stylus
pkgver=1.1.4.1
pkgrel=1
pkgdesc='Easily install themes and skins for many popular sites'
url=https://add0n.com/stylus.html
arch=('any')
license=('GPL3')
source=("https://addons.cdn.mozilla.net/user-media/addons/814814/stylus_beta-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha512sums=('4d1d07625e0ccc9aeeaf011d945c96c1266fd9b9f6732b9c51042025a3c7e4558d40a9586a52d0cb8db403ac6fba2b271fb6eeb4bc17c49f40bc28e8477a6414')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}.xpi
}

# vim:set ts=2 sw=2 et:
