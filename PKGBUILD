# Maintainer: Mark Egan-Fuller <markeganfuller@googlemail.com>
pkgname=opcoffox
pkgver=1.0.0
pkgrel=1
pkgdesc="Script to provide a Firefox connected to an Openconnect VPN without \
affecting the hosts networking."
arch=('x86_64')
url="https://github.com/markeganfuller/opcoffox"
license=('MIT')
depends=('docker' 'docker-compose')
optdepends=('xdialog')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/markeganfuller/opcoffox/archive/${pkgver}.tar.gz")
sha512sums=('af3e5b2d119c7f6e238021cb72047c791a3efd5cac2197330587f96f95614586e220c295e74a9a50880b56dd6348d930805041502f270946c456e0cc19ba2163')

package() {
	cd "${srcdir}/opcoffox-${pkgver}"
        make DESTDIR="$pkgdir/" install
}
