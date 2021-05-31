# Maintainer: zandemax <hi (at) zdmx (dot) me>

pkgname=mestrenova-12
pkgver=12.0.4
pkgrel=2
pkgdesc="Widely used commercial NMR interpreter in Version 12.x"
arch=('x86_64')
url="https://www.mestrelab.com"
install=mestrenova.install
license=('custom:mestrelab')
depends=('libxi' 'glu' 'openssl-1.0')
conflicts=('mestrenova')
source=("https://mestrelab.com/downloads/mnova/linux/Ubuntu/18.04/mestrenova_12.0.4-22023_amd64.deb")
sha256sum=("4ea49f44351082b3dd9bce96537b13f1cea878c657ba97d80d96e23224c930f2")

package() {
    tar -xvf data.tar.gz
    cp -R opt ${pkgdir}/opt

    install -D -m0644 ${pkgdir}/opt/MestReNova/license.txt "${pkgdir}/usr/share/licenses/mestrenova/LICENSE"
}
