# Maintainer: MotorTruck1221 motortruck1221@protonmail.com

pkgname=bare-server-go
pkgver=0.0.1
pkgrel=2
pkgdesc="A TOMPHTTP compliant server written in Go"
url="https://github.com/ruby-network/bare-server-go"
arch=('x86_64')
license=('AGPL3')
# the source is an artifact from the CI
source=("https://github.com/Ruby-Network/bare-server-go/raw/main/bin/bare-server-go")
sha256sums=('7e6f74ff8c091bb5128855360a5afd8c106b937a53e709a1b0fd9969eb1a3ed2')
package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/bare-server-go" "${pkgdir}/usr/bin/bare-server-go"
}
