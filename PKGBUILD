# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-cookie-controller
pkgver=5.5
pkgrel=1
pkgdesc='Buttons for managing cookies, cookie permissions, and site cookie exceptions.'
url='http://forums.mozillazine.org/viewtopic.php?f=48&t=2293961'
arch=('any')
license=('custom:MPLv2')
depends=('firefox')
conflicts=('firefox-extension-cookie-controller')
source=("https://addons.cdn.mozilla.net/user-media/addons/334572/cookie_controller-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('1cb2b7f7fee772f2ddc7715c789763ccca9ae1f6448bd15924137c9f63029975')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{ac2cfa60-bc96-11e0-962b-0800200c9a66}.xpi
}

# vim:set ts=2 sw=2 et:
