# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-new-tab-override
pkgver=14.4.0
pkgrel=1
pkgdesc='Brings back the ability to change the page which is shown when opening a new tab'
url=https://addons.mozilla.org/en-US/firefox/addon/new-tab-override/
arch=('any')
license=('MIT')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/626810/new_tab_override-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('3aa6b060a938b8e10fc669943d17c9b2112ea6a14314305c82e3857cd1d88ff2')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/newtaboverride@agenedia.com.xpi
}

# vim:set ts=2 sw=2 et:
