# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-multiple-tab-handler
pkgver=2.2.1
pkgrel=1
pkgdesc='Provides ability to manage multiple tabs at a time'
url=http://piro.sakura.ne.jp/xul/_multipletab.html.en
arch=('any')
license=('GPL' 'LGPL' 'MPL')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/4838/multiple_tab_handler-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('281e454e6393c45afc6d81badd5e4ea56c3031eacc2f0ea9fa1db3cda4364be2')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/multipletab@piro.sakura.ne.jp.xpi
}

# vim:set ts=2 sw=2 et:
