# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=micasa-bin
pkgver=2.4.0
pkgrel=1
pkgdesc='Modal TUI for tracking home projects, maintenance schedules and vendor quotes'
arch=('x86_64' 'aarch64')
url='https://github.com/micasa-dev/micasa'
license=('Apache-2.0')
provides=('micasa')
conflicts=('micasa')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/micasa_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/micasa_linux_arm64.tar.gz")
sha256sums_x86_64=('4aedb0470103c1e7f353fd3341fa67a8a6230887b79cb3cc91a90492efe57a4c')
sha256sums_aarch64=('d1b8c1f9fd56b0c044ae5c0cc442dc9f5913d56372eec073a4f590992e4bdbbf')

package() {
    install -Dm755 micasa "${pkgdir}/usr/bin/micasa"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/micasa-dev/micasa/blob/main/LICENSE
EOF
}
