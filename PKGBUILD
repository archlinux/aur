# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-multiple-tab-handler
pkgver=2.2.0
pkgrel=1
pkgdesc='Provides ability to manage multiple tabs at a time'
url=http://piro.sakura.ne.jp/xul/_multipletab.html.en
arch=('any')
license=('GPL' 'LGPL' 'MPL')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/4838/multiple_tab_handler-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('319fb918b73fed4a724edd0f5339f319e7b52ed35ebc10d56588a01104912adf')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/multipletab@piro.sakura.ne.jp.xpi
}

# vim:set ts=2 sw=2 et:
