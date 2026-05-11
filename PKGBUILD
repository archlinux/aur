# Maintainer: Bruce Mbudi <bruceowenga@gmail.com>
pkgname=wbts-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="What broke the server — forensic incident timeline for Linux/Docker"
arch=('x86_64' 'aarch64')
url="https://github.com/bruceowenga/wbts"
license=('MIT')
provides=('wbts')
conflicts=('wbts')

source_x86_64=("wbts-${pkgver}-x86_64.tar.gz::https://github.com/bruceowenga/wbts/releases/download/v${pkgver}/wbts_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("wbts-${pkgver}-aarch64.tar.gz::https://github.com/bruceowenga/wbts/releases/download/v${pkgver}/wbts_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('3837fc25f94b7742d39f3bf03a5d9a704ea35955355e5cad3e03b10c65b138f4')
sha256sums_aarch64=('fda8d2b80771c222341f38a99a95bb7f6caa545ec828c9d0cfd4b34db49123c9')

package() {
    install -Dm755 wbts "${pkgdir}/usr/bin/wbts"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
