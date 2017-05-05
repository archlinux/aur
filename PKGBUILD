# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-cookie-controller
pkgver=5.10
pkgrel=1
pkgdesc='Buttons for managing cookies, cookie permissions, and site cookie exceptions.'
url=https://addons.mozilla.org/en-US/firefox/addon/cookie-controller
arch=('any')
license=('custom:MPLv2')
source=("https://addons.cdn.mozilla.net/user-media/addons/334572/cookie_controller-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha512sums=('35b51d6dd1831e52748911193f051c8aa21efa5965d40d571317304704cabfd3cfea5559a0ba1a8a9e43c62565dea5948eeaa9b37fb794b44d5de096283a3b7b')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{ac2cfa60-bc96-11e0-962b-0800200c9a66}.xpi
}

# vim:set ts=2 sw=2 et:
