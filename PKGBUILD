# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-new-tab-override
pkgver=4.0.2
pkgrel=1
pkgdesc='Brings back the ability to change the page which is shown when opening a new tab'
url=https://addons.mozilla.org/en-US/firefox/addon/new-tab-override/
arch=('any')
license=('MIT')
depends=('firefox')
source=("https://addons.cdn.mozilla.net/user-media/addons/626810/new_tab_override_browsernewtaburl_replacement-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('7b21cc85496dc3854b486e27c0e3e3af0f4cec87b0f0b2fa7e5d36d5a40623c2')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/newtaboverride@agenedia.com.xpi
}

# vim:set ts=2 sw=2 et:
