# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=install-wheel-scripts
pkgver=1.0
pkgrel=1
pkgdesc='Install scripts that are able to invoke a wheel’s console_scripts'
arch=(any)
license=(GPL)
depends=(python)
source=(install-wheel-scripts.py)
sha256sums=('edf1cd6f44f6aafc8f02b65ef219411078d792e2de8b9af4ac3f395673ceeb79')

package() {
	install -Dm755 install-wheel-scripts.py "$pkgdir/usr/bin/install-wheel-scripts"
}
