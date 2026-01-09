# Maintainer: Rob Zolkos <rob@zolkos.com>
pkgname=claude-session-export-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Transform Claude Code sessions into shareable HTML documentation"
arch=('x86_64' 'aarch64')
url="https://github.com/robzolkos/claude-session-export"
license=('Apache-2.0')
provides=('claude-session-export')
conflicts=('claude-session-export')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/robzolkos/claude-session-export/releases/download/v${pkgver}/claude-session-export_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/robzolkos/claude-session-export/releases/download/v${pkgver}/claude-session-export_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('474298f1c5131d0cea0a675e607bb04e1d67fba602015f953885a8278621a182')
sha256sums_aarch64=('57de9d3db880f2ca5eb5cf08145610001d0350c0f260c957fdfa2918924b2f7f')

package() {
    install -Dm755 claude-session-export "${pkgdir}/usr/bin/claude-session-export"
}
