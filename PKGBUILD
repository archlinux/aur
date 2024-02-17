# Maintainer: MotorTruck1221 motortruck1221@protonmail.com

pkgname=bare-server-go-git
pkgver=0.0.1
pkgrel=1
pkgdesc="A TOMPHTTP compliant server written in Go"
url="https://github.com/tomphttp/bare-server-go"
arch=('x86_64')
license=('GPL3')
depends=('make' 'go' 'upx')
makedepends=('git')
provides=('bare-server-go')
license=('AGPL3')
conflicts=('bare-server-go')
url="https://github.com/tomphttp/bare-server-go"
source=("git+$url")
sha256sums=('SKIP')
package() {
    cd "${srcdir}/bare-server-go"
    make default
    install -Dm755 "${srcdir}/bare-server-go/bin/bare-server-go" "${pkgdir}/usr/bin/bare-server-go"
}
