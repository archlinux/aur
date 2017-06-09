# Maintainer: Charles Milette <charles.milette@gmail.com>

pkgname=firefox-extension-htitle
pkgver=3.4
pkgrel=1
pkgdesc='Hide title bar if window is maximized - Addon is discontinued but still works as intended'
url=https://github.com/seleznev/$pkgname
arch=('any')
license=('MPL')
source=("https://addons.cdn.mozilla.net/user-media/addons/386325/htitle-$pkgver-sm+tb+fx-linux.xpi")
noextract=("${source##*/}")
sha512sums=('41be1e743fe06dc3cc10935455ca6d65548c9a29e982206fa767d9a0608e85fe04f8b11437e9ee8501a9e3d6f2ab90f4111d6c84277a1f2d04dd00cdc25b34a0')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{c6448328-31f7-4b12-a2e0-5c39d0290307}.xpi
}

# vim:set ts=2 sw=2 et:
