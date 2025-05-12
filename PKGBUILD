# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=nerdlog-bin
pkgver=1.7.0
pkgrel=2
pkgdesc="Nerdlog: fast, remote-first, multi-host TUI log viewer with timeline histogram and no central server"
arch=("any")
url="https://github.com/dimonomid/nerdlog"
license=("BSD-2-Clause")
depends=(
    'glibc'
    'libx11'
)
source=("https://github.com/dimonomid/nerdlog/releases/download/v${pkgver}/nerdlog_${pkgver}_linux_amd64.tar.gz")
b2sums=('33a2b550b03044fc5bb294331d5f7f0e1bcb6315b4671ccb56cb43edc2bd1d5649b806bd7741937acc772429cacc2d10f8a8b9ebb8c7ff8f436b6400ec26733f')

package() {
    install -Dm755 "nerdlog" "${pkgdir}/usr/bin/nerdlog"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
