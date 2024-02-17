# Maintainer: MotorTruck1221 motortruck1221@protonmail.com

pkgname=bare-server-go
pkgver=0.0.2
pkgrel=2
pkgdesc="A TOMPHTTP compliant server written in Go"
url="https://github.com/tomphttp/bare-server-go"
arch=('x86_64')
license=('GPL3')
# the source is an artifact from the CI
source=("https://github.com/tomphttp/bare-server-go/raw/main/bin/bare-server-go")
sha256sums=('1147590f69193251cb4a018d419927233275946c3c3a50b4d5dd42fcbf07423e')
package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/bare-server-go" "${pkgdir}/usr/bin/bare-server-go"
}
