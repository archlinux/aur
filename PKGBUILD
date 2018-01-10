# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=jqassistant
pkgver=1.3.0
pkgrel=1
pkgdesc="Scan, explore and validate your Java application in a few minutes"
arch=('i686' 'x86_64')
url="https://jqassistant.org/"
license=('GPL3')
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
source=('https://jqassistant.org/wp-content/uploads/2017/06/jqassistant-commandline-1.3.0.zip')
noextract=()
md5sums=('6e847165bc095799a4c5613c8d7d1477')

package() {
    install -d /opt/${pkgname}
    cp -a * /opt/${pkgname}
    ln -s /opt/${pkgname}/bin/jqassistant.sh ${pkgdir}/usr/bin/jqassistant
}
