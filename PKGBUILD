# Maintainer: François Pansera <contact@ironcall.dev>
pkgname=ironcall-cli-bin
pkgver=0.1.5
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
    '3dd3bedab8097481734009515874e84e002bc6ec969a95288598abfc9b1518c5'
)

package() {
    install -Dm755 "ironcall-cli-${pkgver}-linux-x86_64" "${pkgdir}/usr/bin/ironcall-cli"
}
