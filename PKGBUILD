# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-new-tab-override
pkgver=8.0.0
pkgrel=1
pkgdesc='Brings back the ability to change the page which is shown when opening a new tab'
url=https://addons.mozilla.org/en-US/firefox/addon/new-tab-override/
arch=('any')
license=('MIT')
source=("https://addons.cdn.mozilla.net/user-media/addons/626810/new_tab_override_webextension-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('664d73a80a79edff156ae828a69238417a92764fc2ce2462cab71f3a2394d847')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/newtaboverride@agenedia.com.xpi
}

# vim:set ts=2 sw=2 et:
