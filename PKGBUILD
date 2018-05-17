# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-multiple-tab-handler
pkgver=2.0.12
pkgrel=1
pkgdesc='Provides ability to manage multiple tabs at a time'
url=http://piro.sakura.ne.jp/xul/_multipletab.html.en
arch=('any')
license=('GPL' 'LGPL' 'MPL')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/4838/multiple_tab_handler-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=('b4501c79df5a7d90796c8987ad44912abb151c079738ece1bd1e67ec84fde4b9')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/multipletab@piro.sakura.ne.jp.xpi
}

# vim:set ts=2 sw=2 et:
