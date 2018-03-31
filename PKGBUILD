# Maintainer: Marc van der Sluys  < git [at] vandersluys [dt] nl >
pkgname=han-ese-ops-arch-rpi
pkgver=0.2
pkgrel=1
pkgdesc="Scripts for the Raspberry Pi for the Final Assignment of HAN ESE OPS"
arch=('any')
url="https://github.com/MarcvdSluys/han-ese-ops-arch-rpi"
license=('GPL3')
depends=('bash' 'python3' 'python-sense-hat' 'python-netifaces')
changelog=ChangeLog
source=("https://github.com/MarcvdSluys/han-ese-ops-arch-rpi/archive/han-ese-ops-arch-rpi-${pkgver}.tar.gz")
sha512sums=('8e39a6d2c6a5c59eafc16f3dcc618d47bafa81e2cafcf668091e7424104791f234a2b4bcf947cfc38c90d00514f1e735380a1ebbf8c7346d7f0e280df58c5585')

package() {
    cd han-ese-ops-arch-rpi-han-ese-ops-arch-rpi-${pkgver}
    mkdir -p ${pkgdir}/usr/bin/ ${pkgdir}/usr/lib/systemd/system/
    cp -vp python/*   ${pkgdir}/usr/bin/
    cp -vp shell/*    ${pkgdir}/usr/bin/
    cp -vp systemd/*  ${pkgdir}/usr/lib/systemd/system/
    chmod a+x ${pkgdir}/usr/bin/*
}
