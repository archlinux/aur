# Maintainer: LINCKODE <linckode at gmail dot com>

_pkgname=xpad-noone
pkgname=xpad-noone-dkms
pkgver=1.0
pkgrel=1
pkgdesc="Xpad kernel driver without Xbox One controller support"
arch=('x86_64')
url="https://github.com/medusalix/xpad-noone"
license=('GPL2')
depends=('dkms')
makedepends=('git')
optdepends=('xone-dkms: Modern Xbox One gamepad driver')
provides=('xpad-noone-dkms')
conflicts=('xpad-noone-dkms')
install=xpad-noone-dkms.install
source=("https://github.com/LINCKODE/xpad-noone/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2ea99342f95a179d874aa0e0e38dfb2b5ae5cee9da03691c2db785bff45d10ed')
package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	echo "> Setting up package"
	install -dm755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
	cp -r ${srcdir}/${_pkgname}-${pkgver}/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

}
