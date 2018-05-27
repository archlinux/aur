# Maintainer: 3yan <zelenkaj@vscht.cz>
# Contributor(s): Pinky <j-pi@seznam.cz>

pkgname=mestrenova
pkgver=12.0.2
pkgrel=1
pkgdesc="Widely used commercial NMR interpreter"
arch=('x86_64')
url="https://www.mestrelab.com"
install=mestrenova.install
license=('custom:mestrelab')
depends=('libxi' 'glu' )
source=("http://mestrelab.com/downloads/mnova/linux/Ubuntu/16.04/mestrenova_12.0.2-20910_amd64.deb")
sha256sums=('4d9d16d3cae95340f265fe0566453fc05a4ac6ce84d5887c300e36c1e47d6620')
        
package() {
    tar -xvf data.tar.gz
    cp -R opt ${pkgdir}/opt

    install -D -m0644 ${pkgdir}/opt/MestReNova/license.txt "${pkgdir}/usr/share/licenses/mestrenova/LICENSE"
}
