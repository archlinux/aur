# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-new-tab-override
pkgver=10.0.0
pkgrel=1
pkgdesc='Brings back the ability to change the page which is shown when opening a new tab'
url=https://addons.mozilla.org/en-US/firefox/addon/new-tab-override/
arch=('any')
license=('MIT')
source=("https://addons.cdn.mozilla.net/user-media/addons/626810/new_tab_override_webextension-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('cf756b14a8e8c59eda3af6d4dc4d38070d496519938659f8facdab618ce9d0a7')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/newtaboverride@agenedia.com.xpi
}

# vim:set ts=2 sw=2 et:
