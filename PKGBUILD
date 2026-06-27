# Maintainer: François Pansera <contact@ironcall.dev>
pkgname=ironcall-cli-bin
pkgver=0.2.0
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
    '05d1c5415550d759ff2e1e7e6c701d233d4440ce2f3908df87a8a462a35292e9'
)

package() {
    install -Dm755 "ironcall-cli-${pkgver}-linux-x86_64" "${pkgdir}/usr/bin/ironcall-cli"
}
