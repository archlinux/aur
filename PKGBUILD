# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-new-tab-override
pkgver=13.0.0
pkgrel=1
pkgdesc='Brings back the ability to change the page which is shown when opening a new tab'
url=https://addons.mozilla.org/en-US/firefox/addon/new-tab-override/
arch=('any')
license=('MIT')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/626810/new_tab_override_webextension-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('7b4957aeae51200944d49781214b61f66df5867372a7b95430e8468438f735b5')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/newtaboverride@agenedia.com.xpi
}

# vim:set ts=2 sw=2 et:
