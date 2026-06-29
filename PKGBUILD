# Maintainer: François Pansera <contact@ironcall.dev>
pkgname=ironcall-cli-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Ironcall CLI - Local-first API client"
arch=('x86_64')
url="https://ironcall.dev"
license=('custom')
provides=('ironcall-cli')
conflicts=('ironcall-cli')
source_x86_64=(
    "ironcall-cli-${pkgver}-linux-x86_64::https://ironcall.dev/releases/cli/${pkgver}/ironcall-cli-${pkgver}-linux-x86_64"
)
sha256sums_x86_64=(
    '92cace2e6c64bd69dd273c59adb23a2b0efa9a6f1e69faf71779bdde4d638cb3'
)

package() {
    install -Dm755 "ironcall-cli-${pkgver}-linux-x86_64" "${pkgdir}/usr/bin/ironcall-cli"
}
