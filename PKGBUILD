# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tab-mover
pkgver=9
pkgrel=1
pkgdesc='Move tabs between windows via the context menu'
url=https://code.guido-berhoerster.org/addons/firefox-addons/tab-mover/
arch=('any')
license=('MPL2')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/786359/tab_mover-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('79da265bb2d0e00e58d320cbff9ea4dce5250390218e7084b20e76bd6ba7964a')

package() {
  install -Dm644 "${source##*/}" \
    "$pkgdir"/usr/lib/firefox/browser/extensions/tab-mover@code.guido-berhoerster.org.xpi
}

# vim:set ts=2 sw=2 et:
