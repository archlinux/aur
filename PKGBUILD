# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=kernel-install-dracut-uki
pkgver=1
pkgrel=1
pkgdesc="kernel-install plugin to build UKIs with dracut"
url="https://github.com/swsnr/kernel-install-dracut-uki"
arch=('any')
license=('APACHE')
depends=('dracut')
source=("https://github.com/swsnr/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('98ddbf9c6e6f8e6222bc5af357f9468a64b331d322bde99accf966d67b39db09')

package() {
    make -C "${srcdir}/${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
}
