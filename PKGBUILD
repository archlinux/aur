# Maintainer: johnnybash <jb at wachenzell dot org> PGP D126E2910543DE2D

pkgname=firefox-extension-foxyproxy-basic
pkgver=7.4.3
pkgrel=1
pkgdesc='FoxyProxy Basic is a simple on/off proxy switcher - basic version'
url=https://github.com/foxyproxy/firefox-extension
arch=('any')
license=('GPL')
groups=('firefox-addons')
source=("https://addons.mozilla.org/firefox/downloads/file/3476522/foxyproxy_basic-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('d13888eb30f5779d7b8969d9f2a1735876f4e372acf917459579cb7ce06217a8')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/foxyproxy-basic@eric.h.jung.xpi
}
