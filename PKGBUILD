# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-referer-control
pkgver=1.24
pkgrel=1
pkgdesc='Control the HTTP Referer on a per-site basis'
url=https://addons.mozilla.org/en-US/firefox/addon/referercontrol
arch=('any')
license=('custom:MPLv2')
source=("https://addons.cdn.mozilla.net/user-media/addons/793120/referer_control-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha512sums=('165b4ad3a26330246dec15f4cf24487b55808765b7deb8d3eb2b9c057f1b4932f803c83d8cda0a024f6309b79b2af737bf7a55c358518711e4ff9c94f7ed15ff')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{cde47992-8aa7-4206-9e98-680a2d20f798}.xpi
}

# vim:set ts=2 sw=2 et:
