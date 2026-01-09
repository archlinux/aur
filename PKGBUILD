# Maintainer: Rob Zolkos <rob@zolkos.com>
pkgname=claude-session-export-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Transform Claude Code sessions into shareable HTML documentation"
arch=('x86_64' 'aarch64')
url="https://github.com/robzolkos/claude-session-export"
license=('Apache-2.0')
provides=('claude-session-export')
conflicts=('claude-session-export')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/robzolkos/claude-session-export/releases/download/v${pkgver}/claude-session-export_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/robzolkos/claude-session-export/releases/download/v${pkgver}/claude-session-export_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('ab58417f5d1b414a142a00a4224cde7269b2b1024cb95d1bf5a1ff71f9a913f5')
sha256sums_aarch64=('915be87001345811b13527c66110161ca71842b99bcd95a1765dd20220e80f35')

package() {
    install -Dm755 claude-session-export "${pkgdir}/usr/bin/claude-session-export"
}
