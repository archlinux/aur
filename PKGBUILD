# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-tridactyl
pkgver=1.6.1
pkgrel=1
pkgdesc="Replace Firefox's control mechanism with one modelled on Vim"
url=https://github.com/cmcaine/tridactyl
arch=('any')
license=('Apache')
source=("https://addons.cdn.mozilla.net/user-media/addons/873070/tridactyl-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('702b5f55fbc0a929a8f86fd3c957cfd5b975ce5e26d54d91788d8abf2c2c1388')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/tridactyl.vim@cmcaine.co.uk.xpi
}

# vim:set ts=2 sw=2 et:
