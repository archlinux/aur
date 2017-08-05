# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-cookie-controller
pkgver=6.0
pkgrel=1
pkgdesc='Buttons for managing cookies, cookie permissions, and site cookie exceptions.'
url=https://addons.mozilla.org/en-US/firefox/addon/cookie-controller
arch=('any')
license=('custom:MPLv2')
source=("https://addons.cdn.mozilla.net/user-media/addons/334572/cookie_controller-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha512sums=('19432a9f74d75002f50136cfff0bed32b29f9bbc32bfd4c050fd7dfee61839ce672267ba356466c5ce7f5f6bd601a141e8105cd9f37bbe66b46017a5b25fe46d')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{ac2cfa60-bc96-11e0-962b-0800200c9a66}.xpi
}

# vim:set ts=2 sw=2 et:
