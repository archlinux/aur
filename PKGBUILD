# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-new-tab-override
pkgver=3.1
pkgrel=1
pkgdesc='Brings back the ability to change the page which is shown when opening a new tab'
url=https://addons.mozilla.org/en-US/firefox/addon/new-tab-override/
arch=('any')
license=('MIT')
depends=('firefox')
conflicts=('firefox-extension-new-tab-override')
source=("https://addons.cdn.mozilla.net/user-media/addons/626810/new_tab_override_browsernewtaburl_replacement-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('c05ceae339f3a439d0501202eef2723524355f2d7244a9bbf0fe31d8a8ed4cd4')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/newtaboverride@agenedia.com.xpi
}

# vim:set ts=2 sw=2 et:
