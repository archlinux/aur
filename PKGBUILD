# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tab-mover
pkgver=7
pkgrel=1
pkgdesc='Move tabs between windows via the context menu'
url=https://code.guido-berhoerster.org/addons/firefox-addons/tab-mover/
arch=('any')
license=('MPL2')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/786359/tab_mover-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('bbf66e425e97017e929de0a5c60ca5c810a1f8c1fbc9e79146035f24dbb63383')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/tab-mover@code.guido-berhoerster.org.xpi
}

# vim:set ts=2 sw=2 et:
