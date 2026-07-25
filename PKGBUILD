# Maintainer: <https://github.com/krayn1um>
pkgname=iplan
pkgver=1.0
pkgrel=1
pkgdesc="Prints the local LAN router IP address"
arch=('any')
license=('MIT')
depends=('iproute2' 'gawk')
source=("https://github.com/krayn1um/iplan/raw/main/iplan.sh")
sha256sums=('2a9b6ce611df65fa0aef721aea5083a0a5a674730521bb61ae91bf8d3bcaf5af')

package() {
    install -Dm755 "${srcdir}/iplan.sh" "${pkgdir}/usr/bin/iplan"
}
