# Maintainer: Bruce Mbudi <bruceowenga@gmail.com>
pkgname=wbts-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="What broke the server — forensic incident timeline for Linux/Docker"
arch=('x86_64' 'aarch64')
url="https://github.com/bruceowenga/wbts"
license=('MIT')
provides=('wbts')
conflicts=('wbts')

source_x86_64=("wbts-${pkgver}-x86_64.tar.gz::https://github.com/bruceowenga/wbts/releases/download/v${pkgver}/wbts_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("wbts-${pkgver}-aarch64.tar.gz::https://github.com/bruceowenga/wbts/releases/download/v${pkgver}/wbts_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('31ef1d10e135c652b532c51bd3adc0ec5b0eaa0fda09eca865d3771342d730d0')
sha256sums_aarch64=('c8afd2a49029d084b2a6b12974ac3ee336018aa267bd3a90f2db180ce948dc31')

package() {
    install -Dm755 wbts "${pkgdir}/usr/bin/wbts"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
