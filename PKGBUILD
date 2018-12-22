# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-multiple-tab-handler
pkgver=3.0.1
pkgrel=1
pkgdesc='Provides ability to manage multiple tabs at a time'
url=http://piro.sakura.ne.jp/xul/_multipletab.html.en
arch=('any')
license=('GPL' 'LGPL' 'MPL')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/4838/multiple_tab_handler-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('9719e923bb285a810c2c18f86ffcdf75909900b27c6b57c2031d135ee71b4c9a')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/multipletab@piro.sakura.ne.jp.xpi
}

# vim:set ts=2 sw=2 et:
