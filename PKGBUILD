# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=nerdlog-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Nerdlog: fast, remote-first, multi-host TUI log viewer with timeline histogram and no central server"
arch=("any")
url="https://github.com/dimonomid/nerdlog"
license=("BSD-2-Clause")
depends=(
    'glibc'
    'libx11'
)
source=("https://github.com/dimonomid/nerdlog/releases/download/v${pkgver}/nerdlog_${pkgver}_linux_amd64.tar.gz")
b2sums=('cdeb4304fadfa8aedd818390adc3240a29398fe28fceddb797d2cd1938a470f44f85468f344811ed8285713101567550a8f77bb9a43cc72aaeeb0c802afb8a75')

package() {
    install -Dm755 "nerdlog" "${pkgdir}/usr/bin/nerdlog"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
