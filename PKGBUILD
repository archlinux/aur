# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-extension-cookie-controller
pkgver=4.7
pkgrel=1
pkgdesc='Buttons for managing cookies, cookie permissions, and site cookie exceptions.'
url=https://addons.mozilla.org/en-US/firefox/addon/cookie-controller
arch=('any')
license=('custom:MPLv2')
depends=('firefox')
source=("https://addons.cdn.mozilla.net/user-media/addons/334572/cookie_controller-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('6d35c0d819e88266a38c359d2bf84647b89e4c49b51965cee90d2dcaecbc882b')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{ac2cfa60-bc96-11e0-962b-0800200c9a66}.xpi
}

# vim:set ts=2 sw=2 et:
