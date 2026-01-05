# Maintainer: Rob Zolkos <rob@zolkos.com>
pkgname=claude-session-export-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Transform Claude Code sessions into shareable HTML documentation"
arch=('x86_64' 'aarch64')
url="https://github.com/robzolkos/claude-session-export"
license=('Apache-2.0')
provides=('claude-session-export')
conflicts=('claude-session-export')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/robzolkos/claude-session-export/releases/download/v${pkgver}/claude-session-export_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/robzolkos/claude-session-export/releases/download/v${pkgver}/claude-session-export_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('ef8cdc6b442c5c8c03c88aaa1411cc7f58f9557b14c116c73ba02035ca35ca3a')
sha256sums_aarch64=('5c106a8a20e332f8d328fc98dfa6a6527e185786eaf4b5da9ca31e22226299a0')

package() {
    install -Dm755 claude-session-export "${pkgdir}/usr/bin/claude-session-export"
}
