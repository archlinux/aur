# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-tridactyl
pkgver=1.9.7
pkgrel=1
pkgdesc="Replace Firefox's control mechanism with one modelled on Vim"
url=https://github.com/cmcaine/tridactyl
arch=('any')
license=('Apache')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/873070/tridactyl-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('8c9d1024d314e2feb4c0416b1367d1aa6769f0d1fd5753a03da7ea0c37ab050d')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/tridactyl.vim@cmcaine.co.uk.xpi
}

# vim:set ts=2 sw=2 et:
