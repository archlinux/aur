# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-new-tab-override
pkgver=5.0
pkgrel=1
pkgdesc='Brings back the ability to change the page which is shown when opening a new tab'
url=https://addons.mozilla.org/en-US/firefox/addon/new-tab-override/
arch=('any')
license=('MIT')
source=("https://addons.cdn.mozilla.net/user-media/addons/626810/new_tab_override_browsernewtaburl_replacement-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha512sums=('e7ffe32549f4c248ff77fdbabca5cf7ec3a251b94444486ace445e9cc217564b81b95cf1b4a39288333fc32c04b84cec596a1cf623945ecd008f64d367c42cab')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/newtaboverride@agenedia.com.xpi
}

# vim:set ts=2 sw=2 et:
