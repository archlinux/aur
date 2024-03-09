# Maintainer: MotorTruck1221 motortruck1221@protonmail.com

pkgname=corlink-server
pkgver=0.0.1
pkgrel=2
pkgdesc="The corlink license server for the corlink project."
url="https://github.com/ruby-network/corlink/license"
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ruby-network/corlink/raw/main/licensing/bin/corlink-server")
sha256sums=('SKIP')
package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/corlink-server" "${pkgdir}/usr/bin/corlink-server"
}
