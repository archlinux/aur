# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-extension-new-tab-override
pkgver=3.0
pkgrel=1
pkgdesc='Brings back the ability to change the page which is shown when opening a new tab'
url=https://addons.mozilla.org/en-US/firefox/addon/new-tab-override/
arch=('any')
license=('MIT')
depends=('firefox')
source=("https://addons.cdn.mozilla.net/user-media/addons/626810/new_tab_override_browsernewtaburl_replacement-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('f6e7451ed030076743054ac899f0ac2490a2d2aece306b63019065a3563ca979')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/newtaboverride@agenedia.com.xpi
}

# vim:set ts=2 sw=2 et:
