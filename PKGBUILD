# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-multiple-tab-handler
pkgver=2.1.0
pkgrel=1
pkgdesc='Provides ability to manage multiple tabs at a time'
url=http://piro.sakura.ne.jp/xul/_multipletab.html.en
arch=('any')
license=('GPL' 'LGPL' 'MPL')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/4838/multiple_tab_handler-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=('9f36af45f220804b93ed4c80c342ffd1cb2ede15b30864c7a092c6ecec244cee')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/multipletab@piro.sakura.ne.jp.xpi
}

# vim:set ts=2 sw=2 et:
