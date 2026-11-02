# Maintainer: Zius <ziuusdev@gmail.com>

pkgname=goroute-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Ultra-lightweight LLM gateway and multi-account router in Go (< 5MB RAM)"
arch=('x86_64' 'aarch64')
url="https://github.com/ziuus/goroute"
license=('MIT')
provides=('goroute')
conflicts=('goroute')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/ziuus/goroute/releases/download/v${pkgver}/goroute_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/ziuus/goroute/releases/download/v${pkgver}/goroute_Linux_arm64.tar.gz")

sha256sums_x86_64=('bfc7c593a2f2c485db31973b0342208f8d47f1c923966929313f98e080e9b719')
sha256sums_aarch64=('2f1cebe6235e97edf6099f0ff812a727eb7428465c11973307649abcc84423ec')

package() {
    install -Dm755 "${srcdir}/goroute" "${pkgdir}/usr/bin/goroute"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
