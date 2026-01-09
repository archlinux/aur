# Maintainer: Rob Zolkos <rob@zolkos.com>
pkgname=claude-session-export-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Transform Claude Code sessions into shareable HTML documentation"
arch=('x86_64' 'aarch64')
url="https://github.com/robzolkos/claude-session-export"
license=('Apache-2.0')
provides=('claude-session-export')
conflicts=('claude-session-export')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/robzolkos/claude-session-export/releases/download/v${pkgver}/claude-session-export_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/robzolkos/claude-session-export/releases/download/v${pkgver}/claude-session-export_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('425ddc5db1ba3baf539a8b3ab4371bb2c2c615a9aa7ab1e84b599f325d1e3af8')
sha256sums_aarch64=('100623a85f048410588b627e8732f2713b8592574bc8ecd2fe80fa389e7af595')

package() {
    install -Dm755 claude-session-export "${pkgdir}/usr/bin/claude-session-export"
}
