# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-new-tab-override
pkgver=12.0.0
pkgrel=1
pkgdesc='Brings back the ability to change the page which is shown when opening a new tab'
url=https://addons.mozilla.org/en-US/firefox/addon/new-tab-override/
arch=('any')
license=('MIT')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/626810/new_tab_override_webextension-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('51c161677d4f47617b8de130f3d8c5031c5cc4f9bd6dd65e99c3ce909017613d')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/newtaboverride@agenedia.com.xpi
}

# vim:set ts=2 sw=2 et:
