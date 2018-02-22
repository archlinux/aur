# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=firefox-cookie-controller
pkgver=6.1
pkgrel=1
pkgdesc='Buttons for managing cookies, cookie permissions, and site cookie exceptions.'
url=https://addons.mozilla.org/en-US/firefox/addon/cookie-controller
arch=('any')
license=('custom:MPLv2')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/334572/cookie_controller-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha512sums=('1c226b5e1afe11f7473232e8a6ce5cadaa42bbbff29a429d74c1586b5957d298bba94ea7340cb6839b840d9d7ae1ca08563a71ef89e8527e2ce583d832b227dd')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{ac2cfa60-bc96-11e0-962b-0800200c9a66}.xpi
}

# vim:set ts=2 sw=2 et:
