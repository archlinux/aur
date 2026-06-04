# Maintainer: François Pansera <contact@ironcall.dev>
pkgname=ironcall-cli-bin
pkgver=0.1.4
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
    '1b248bba7fba9ad5719bdc4433568b6268dbe104d97095ceb2974f3ac794f8bc'
)

package() {
    install -Dm755 "ironcall-cli-${pkgver}-linux-x86_64" "${pkgdir}/usr/bin/ironcall-cli"
}
