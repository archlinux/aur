# Maintainer: MotorTruck1221 motortruck1221@protonmail.com

pkgname=corlink-server
pkgver=1.0.0
pkgrel=2
pkgdesc="The corlink license server for the corlink project."
url="https://github.com/ruby-network/corlink/license"
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ruby-network/corlink/raw/main/licensing/bin/corlink-server")
sha256sums=('a609c6b5b3af42d2496b1adb66a4773a215c31aa246e56b282936aee06d6c729')
package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/corlink-server" "${pkgdir}/usr/bin/corlink-server"
}
