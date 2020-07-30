# Maintainer: johnnybash <jb at wachenzell dot org> PGP D126E2910543DE2D

pkgname=firefox-extension-foxyproxy-basic
pkgver=7.5.1
pkgrel=1
pkgdesc='FoxyProxy Basic is a simple on/off proxy switcher - basic version'
url=https://github.com/foxyproxy/firefox-extension
arch=('any')
license=('GPL')
source=("https://addons.cdn.mozilla.net/user-media/addons/15023/foxyproxy_basic-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('be5ae57899dc010d2bcc1cebf5e444614d023ffc682b11f4c8ad0c5f83df866b')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/foxyproxy-basic@eric.h.jung.xpi
}
