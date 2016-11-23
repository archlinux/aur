# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-refcontrol
pkgver=0.8.17
pkgrel=5
pkgdesc='Control what gets sent as the HTTP Referer on a per-site basis.'
url=http://www.stardrifter.org/refcontrol/
arch=('any')
license=('MPL' 'GPL' 'LGPL')
depends=('firefox')
conflicts=('firefox-extension-refcontrol')
source=("https://addons.cdn.mozilla.net/user-media/addons/953/refcontrol-$pkgver-sm+fx.xpi")
noextract=("${source##*/}")
sha256sums=('a9cbacd40e6884ddfe7d22a546d3c9e504692554be5988dc127db21b69d67f73')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{455D905A-D37C-4643-A9E2-F6FEFAA0424A}.xpi
}

# vim:set ts=2 sw=2 et:
