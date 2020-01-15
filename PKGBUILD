# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=install-wheel-scripts
pkgver=1.1
pkgrel=1
pkgdesc='Install scripts that are able to invoke a wheel’s console_scripts'
arch=(any)
license=(GPL)
depends=(python)
source=(install-wheel-scripts.py)
sha256sums=('3cf4c43dfc43de82b453c132980d41a71ef0d619eb6a09c7ea659f6937836616')

package() {
	install -Dm755 install-wheel-scripts.py "$pkgdir/usr/bin/install-wheel-scripts"
}
