# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=micasa-bin
pkgver=2.3.0
pkgrel=1
pkgdesc='Modal TUI for tracking home projects, maintenance schedules and vendor quotes'
arch=('x86_64' 'aarch64')
url='https://github.com/cpcloud/micasa'
license=('Apache-2.0')
provides=('micasa')
conflicts=('micasa')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/micasa_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/micasa_linux_arm64.tar.gz")
sha256sums_x86_64=('8a5ad6073ca9e086677ec4252fae04a8618d9f41afdd37fb10a45caf9f514978')
sha256sums_aarch64=('6924c6062d97671f578ad23eb169e21c9a3bf6f77045caaec3ec9852cb23e86f')

package() {
    install -Dm755 micasa "${pkgdir}/usr/bin/micasa"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/cpcloud/micasa/blob/main/LICENSE
EOF
}
