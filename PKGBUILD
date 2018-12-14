# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tridactyl
pkgver=1.14.6
pkgrel=1
pkgdesc="Replace Firefox's control mechanism with one modelled on Vim"
url=https://github.com/cmcaine/tridactyl
arch=('any')
license=('Apache')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/873070/tridactyl-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('ed4ad0c06ba32bdd40eb59a1cdeac48ec556276fafdecad8de0d56d8d2855bea')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/tridactyl.vim@cmcaine.co.uk.xpi
}

# vim:set ts=2 sw=2 et:
