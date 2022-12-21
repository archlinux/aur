# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=kernel-install-dracut-uki
pkgver=2
pkgrel=1
pkgdesc="kernel-install plugin to build UKIs with dracut"
url="https://github.com/swsnr/kernel-install-dracut-uki"
arch=('any')
license=('APACHE')
# dracut requires binutils for --uefi support
depends=('dracut' 'binutils')
source=("https://github.com/swsnr/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('76f90eb6d6d2cbfabb1780633f72e3b3f791d96c414684219ffd62f500b01e24')

package() {
    make -C "${srcdir}/${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
}
