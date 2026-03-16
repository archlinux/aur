# Maintainer: Ignacio Medina <ignacionmedina1@gmail.com>
pkgname=routeros-cli-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI tool for managing MikroTik RouterOS routers with structured JSON output"
arch=('x86_64' 'aarch64')
url="https://github.com/nic0der-im/routeros-cli"
license=('MIT')
provides=('routeros-cli')
conflicts=('routeros-cli')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/nic0der-im/routeros-cli/releases/download/v${pkgver}/routeros-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/nic0der-im/routeros-cli/releases/download/v${pkgver}/routeros-cli_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('d43877c4976af874a7c8d5f9fc633c7ed1e0a5512dead08b3d9d6b99217697f6')
sha256sums_aarch64=('0a568ab3049ac6079d301631907dac806f3cd88328e687c57ed4957e0ed39fda')

package() {
    install -Dm755 routeros-cli "${pkgdir}/usr/bin/routeros-cli"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
