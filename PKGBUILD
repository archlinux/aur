# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-new-tab-override
pkgver=4.0.1
pkgrel=1
pkgdesc='Brings back the ability to change the page which is shown when opening a new tab'
url=https://addons.mozilla.org/en-US/firefox/addon/new-tab-override/
arch=('any')
license=('MIT')
depends=('firefox')
source=("https://addons.cdn.mozilla.net/user-media/addons/626810/new_tab_override_browsernewtaburl_replacement-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('a1f50255657534ac36ab625d7ba0970a1b076870f1f3989078698ac3121d7802')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/newtaboverride@agenedia.com.xpi
}

# vim:set ts=2 sw=2 et:
