# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=eclipse-installer
pkgver=1.0
pkgrel=2
pkgdesc="Automates the installation and update of Eclipse development environments"
arch=('i686' 'x86_64')
url="https://wiki.eclipse.org/Eclipse_Installer"
license=('EPL')
groups=()
depends=('')
makedepends=('')
optdepends=()
provides=()
conflicts=('')
replaces=()
backup=()
options=()
install=()
changelog=()
source=('https://mirrors.dotsrc.org/eclipse//oomph/products/eclipse-inst-linux64.tar.gz')
noextract=()
md5sums=('')

package() {
    install -d ${pkgdir}/opt/${pkgname}
    cp -a ./* ${pkgdir}/opt/
    rm ${pkgdir}/opt/eclipse-inst-linux64.tar.gz
    
    install -d ${pkgdir}/usr/bin/
    ln -s /opt/${pkgname}/eclipse-inst ${pkgdir}/usr/bin/${pkgname}
}
