# Maintainer: Victor Golovanenko <drygdryg2014 at yandex dot com>
pkgname=chromium-beacondb-patch-hook
pkgver=1.0.0
pkgrel=1
pkgdesc='Pacman hook that patch Chromium web browser files to use BeaconDB as a geolocation API (instead of Google Geolocation API)'
arch=(any)
license=(LicenseRef-None)
depends=(sed)
source=('chromium-beacondb-patch.hook')
sha256sums=('c7f254fd7de10fc555867ff64a29a2049f1d6975d7bb71bec8fc2634c454f15c')

package () {
	install -d "${pkgdir}/usr/share/libalpm/hooks"
	install -m644 "${srcdir}/chromium-beacondb-patch.hook" "${pkgdir}/usr/share/libalpm/hooks/"
}
