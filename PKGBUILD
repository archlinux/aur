# Maintainer: MotorTruck1221 motortruck1221@protonmail.com

pkgname=bare-server-go
pkgver=0.0.3
pkgrel=2
pkgdesc="A TOMPHTTP compliant server written in Go"
url="https://github.com/tomphttp/bare-server-go"
arch=('x86_64')
license=('GPL3')
# the source is an artifact from the CI
source=("https://github.com/tomphttp/bare-server-go/raw/main/bin/bare-server-go")
sha256sums=('016373056bcede319cddf9942b5f0f46dd14998038bad6caca808f07ad97cb99')
package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/bare-server-go" "${pkgdir}/usr/bin/bare-server-go"
}
