# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-tridactyl
pkgver=1.10.0
pkgrel=1
pkgdesc="Replace Firefox's control mechanism with one modelled on Vim"
url=https://github.com/cmcaine/tridactyl
arch=('any')
license=('Apache')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/873070/tridactyl-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('6a768ff062ac9df5ba6377e361f4db3b1f424fffe4be3685436cef260fa27951')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/tridactyl.vim@cmcaine.co.uk.xpi
}

# vim:set ts=2 sw=2 et:
