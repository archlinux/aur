# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-tridactyl
pkgver=1.13.2
pkgrel=1
pkgdesc="Replace Firefox's control mechanism with one modelled on Vim"
url=https://github.com/cmcaine/tridactyl
arch=('any')
license=('Apache')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/873070/tridactyl-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('eb5b63cecbb3dd5cbe5c9f7e840b0ee175bdeca61d5c50936c541030430012bb')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/tridactyl.vim@cmcaine.co.uk.xpi
}

# vim:set ts=2 sw=2 et:
