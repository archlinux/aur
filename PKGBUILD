# Maintainer: François Pansera <contact@ironcall.dev>
pkgname=ironcall-cli-bin
pkgver=0.1.2
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
    'dc3fd2b8bed1caa6ae8edc0271e579cb3458700f2340d7b8cd317a03975a93e1'
)

package() {
    install -Dm755 "ironcall-cli-${pkgver}-linux-x86_64" "${pkgdir}/usr/bin/ironcall-cli"
}
