# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-refcontrol
pkgver=0.8.17
pkgrel=5
pkgdesc='Control what gets sent as the HTTP Referer on a per-site basis.'
url=http://www.stardrifter.org/refcontrol/
arch=('any')
license=('MPL' 'GPL' 'LGPL')
source=("https://addons.cdn.mozilla.net/user-media/addons/953/refcontrol-$pkgver-sm+fx.xpi")
noextract=("${source##*/}")
sha512sums=('966554a52cf87ac70682b54abb5c35e2f145509d6c37be8224ffe9c1c8eb9ccd756b8e11a11b6be5fb1fb87e45878286416c8c1fa08515e6333707511dd352dc')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{455D905A-D37C-4643-A9E2-F6FEFAA0424A}.xpi
}

# vim:set ts=2 sw=2 et:
