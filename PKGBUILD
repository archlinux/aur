# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-tridactyl
pkgver=1.8.2
pkgrel=1
pkgdesc="Replace Firefox's control mechanism with one modelled on Vim"
url=https://github.com/cmcaine/tridactyl
arch=('any')
license=('Apache')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/873070/tridactyl-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('5ebb7f69e99c4d5945419f893929e3ca568b0e7feedfa6d5131b9e0d890827e8')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/tridactyl.vim@cmcaine.co.uk.xpi
}

# vim:set ts=2 sw=2 et:
