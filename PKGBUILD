# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-extension-cookie-controller
pkgver=4.5
pkgrel=1
pkgdesc='Buttons for managing cookies, cookie permissions, and site cookie exceptions.'
url=https://addons.mozilla.org/en-US/firefox/addon/cookie-controller
arch=('any')
license=('custom:MPLv2')
depends=('firefox')
source=("https://addons.cdn.mozilla.net/user-media/addons/334572/cookie_controller-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('d11f81b6431cb7987683a687e6b7509cb81d2164b199b082e9a6aa280cc1db83')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{ac2cfa60-bc96-11e0-962b-0800200c9a66}.xpi
}

# vim:set ts=2 sw=2 et:
