# Maintainer: Speedy_Lex <speedy_lex@tuta.io>
# Contributor: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-dkms-fixed
pkgdesc="Fork of amneziawg-dkms fixing many issues with the PKGBUILD. Original maintainer unresponsive as of 2025-04-17"
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("any")
pkgver=1.0.20260210
pkgrel=1
license=('GPLv2')
depends=("dkms")
provides=("amneziawg-dkms")
conflicts=("amneziawg-dkms")
source=("amneziawg-linux-kernel-module-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('705fbbb13e5d2f456fb321942ecd404420c5e54c75fbd28b7fd34583c9d6b0ca3b63e3eb18ddbb49f34354ffa0c042745fe2a0c97946a4dab65b52ebc864d5b5')

package() {
    cd "${srcdir}/amneziawg-linux-kernel-module-${pkgver}"

    install -d "${pkgdir}/usr/src/amneziawg-${pkgver}"
    cp -r ./src/* "${pkgdir}/usr/src/amneziawg-${pkgver}"
}
