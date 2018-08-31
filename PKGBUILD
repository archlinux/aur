# Maintainer: 3yan <zelenkaj@vscht.cz>
# Contributor(s): Pinky <j-pi@seznam.cz>

pkgname=mestrenova
pkgver=12.0.3
pkgrel=1
pkgdesc="Widely used commercial NMR interpreter"
arch=('x86_64')
url="https://www.mestrelab.com"
install=mestrenova.install
license=('custom:mestrelab')
depends=('libxi' 'glu' 'openssl-1.0')
source=("http://mestrelab.com/downloads/mnova/linux/Ubuntu/16.04/mestrenova_12.0.3-21384_amd64.deb")
sha256sums=('4ea49f44351082b3dd9bce96537b13f1cea878c657ba97d80d96e23224c930f2')
        
package() {
    tar -xvf data.tar.gz
    cp -R opt ${pkgdir}/opt

    install -D -m0644 ${pkgdir}/opt/MestReNova/license.txt "${pkgdir}/usr/share/licenses/mestrenova/LICENSE"
}
