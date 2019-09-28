# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-new-tab-override
pkgver=14.3.0
pkgrel=1
pkgdesc='Brings back the ability to change the page which is shown when opening a new tab'
url=https://addons.mozilla.org/en-US/firefox/addon/new-tab-override/
arch=('any')
license=('MIT')
groups=('firefox-addons')
source=("https://addons.mozilla.org/firefox/downloads/file/3174621/new_tab_override_webextension-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('5df0323564d2d2f39834128b4dfb81a01330385974436778899599936678b8e0')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/newtaboverride@agenedia.com.xpi
}

# vim:set ts=2 sw=2 et:
