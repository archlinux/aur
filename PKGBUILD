# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-cookie-controller
pkgver=5.8
pkgrel=1
pkgdesc='Buttons for managing cookies, cookie permissions, and site cookie exceptions.'
url=https://addons.mozilla.org/en-US/firefox/addon/cookie-controller
arch=('any')
license=('custom:MPLv2')
source=("https://addons.cdn.mozilla.net/user-media/addons/334572/cookie_controller-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha512sums=('4f25e256073b6dc88796d40cc8e2e982c07b8c74dd37017fe10f3d089c3ed1799647682f943943c7d36660431dd42a25123f5fc49523f77a049edb25cfc01efe')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{ac2cfa60-bc96-11e0-962b-0800200c9a66}.xpi
}

# vim:set ts=2 sw=2 et:
