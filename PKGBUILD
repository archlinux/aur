# Maintainer: Marc van der Sluys  < han [at] vandersluys [dt] nl >
pkgname=han-ese-ops_rpi
pkgver=0.1
pkgrel=1
pkgdesc="Scripts for the Raspberry Pi for the Final Assignment of HAN ESE OPS."
arch=('any')
url="https://github.com/han-ese/Arch-RPi"
license=('GPL3')
depends=('bash' 'python3')
changelog=ChangeLog
source=("https://github.com/han-ese/Arch-RPi/archive/v${pkgver}.tar.gz")
sha512sums=('d70e5c2a6aff7649b956164876e5e7f7d6005c5e9966882d17245046c23b1f77e8624d72ebe07eaa0118e9ec50bb6df19254e03cb81cefac4d7fb57df7d347af')

package() {
    cd Arch-RPi-${pkgver}
    mkdir -p ${pkgdir}/usr/bin/ ${pkgdir}/usr/lib/systemd/system/
    cp -vp python/*   ${pkgdir}/usr/bin/
    cp -vp shell/*    ${pkgdir}/usr/bin/
    cp -vp systemd/*  ${pkgdir}/usr/lib/systemd/system/
    chmod a+x ${pkgdir}/usr/bin/*
}
