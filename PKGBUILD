# Maintainer: johnnybash <jb at wachenzell dot org> PGP D126E2910543DE2D

pkgname=firefox-extension-foxyproxy-basic
pkgver=7.5
pkgrel=1
pkgdesc='FoxyProxy Basic is a simple on/off proxy switcher - basic version'
url=https://github.com/foxyproxy/firefox-extension
arch=('any')
license=('GPL')
source=("https://addons.cdn.mozilla.net/user-media/addons/15023/foxyproxy_basic-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('86af822c36c8488831c3b1b18a5d766c3b734f98c1f9bbfe4ca3e28cce2da4a5')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/foxyproxy-basic@eric.h.jung.xpi
}
