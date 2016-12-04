# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-cookie-controller
pkgver=5.7
pkgrel=1
pkgdesc='Buttons for managing cookies, cookie permissions, and site cookie exceptions.'
url=https://addons.mozilla.org/en-US/firefox/addon/cookie-controller
arch=('any')
license=('custom:MPLv2')
depends=('firefox')
conflicts=('firefox-extension-cookie-controller')
source=("https://addons.cdn.mozilla.net/user-media/addons/334572/cookie_controller-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha512sums=('317698ea2acd4284f775ed6ab15a11734dddbe38fdb481de3c7090128c73163588a377feb466a8bfd72b70cdcb19cec3eae8d88a7adc2507f92840d763cf761c')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{ac2cfa60-bc96-11e0-962b-0800200c9a66}.xpi
}

# vim:set ts=2 sw=2 et:
