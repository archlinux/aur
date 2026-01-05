# Maintainer: Rob Zolkos <rob@zolkos.com>
pkgname=claude-session-export-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Transform Claude Code sessions into shareable HTML documentation"
arch=('x86_64' 'aarch64')
url="https://github.com/robzolkos/claude-session-export"
license=('Apache-2.0')
provides=('claude-session-export')
conflicts=('claude-session-export')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/robzolkos/claude-session-export/releases/download/v${pkgver}/claude-session-export_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/robzolkos/claude-session-export/releases/download/v${pkgver}/claude-session-export_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('51ea301153fcc99d8a8414606de05b53cc1d4c255a078b62d5645f395b641e5e')
sha256sums_aarch64=('782af40d4a763043905f40a8b9a2c340587e5d3a750432ea18780f0c4f10290e')

package() {
    install -Dm755 claude-session-export "${pkgdir}/usr/bin/claude-session-export"
}
