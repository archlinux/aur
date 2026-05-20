# Maintainer: justice-reaper <tu@email.com>
pkgname=acp6x-victus-16e1-dkms
pkgver=1.0
pkgrel=1
pkgdesc="Patched AMD ACP6x Audio Driver for HP Victus 16-e1xxx (fixes internal microphone)"
arch=('x86_64')
url="https://bugzilla.kernel.org/show_bug.cgi?id=218926"
license=('GPL2')
depends=('dkms')
install=${pkgname}.install
source=("dkms.conf"
        "acp6x-mach.c"
        "acp6x-pdm-dma.c"
        "acp6x.h"
        "Makefile")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
    cp dkms.conf "${pkgdir}/usr/src/${pkgname}-${pkgver}/"
    cp acp6x-mach.c acp6x-pdm-dma.c acp6x.h Makefile "${pkgdir}/usr/src/${pkgname}-${pkgver}/"
}
