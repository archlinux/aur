# Maintainer: Shyamin Ayesh <me@shyamin.com>

pkgname="sofka"
pkgdesc="A Kubernetes TUI written in Rust"
pkgver=0.21.0
pkgrel=1
arch=("x86_64")
license=("MIT")
url="https://github.com/nklmilojevic/${pkgname}"
source=("${url}/releases/download/v${pkgver}/sofka-v0.21.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("21a127f45ba743ff1fc1fc13f8d69d4e296dd48ecd8476a74cb13e1355e5f977")

package() {

    # CREATE DIRs
    install -d "${pkgdir}/usr/bin"

    # Install ( binary )
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

}