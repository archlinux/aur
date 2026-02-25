# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=micasa-bin
pkgver=1.50.0
pkgrel=1
pkgdesc='Modal TUI for tracking home projects, maintenance schedules and vendor quotes'
arch=('x86_64' 'aarch64')
url='https://github.com/cpcloud/micasa'
license=('Apache-2.0')
provides=('micasa')
conflicts=('micasa')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/micasa_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/micasa_linux_arm64.tar.gz")
sha256sums_x86_64=('9a64730920dfe89539ca0bf267c28da12f0d1a4b6d4dfac258a2bb3aec5d2587')
sha256sums_aarch64=('76e94ee905e250caeb17e94b3fe0c4d8db16a9c0f7f83f1bd34b6ad152c82b7b')

package() {
    install -Dm755 micasa "${pkgdir}/usr/bin/micasa"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/cpcloud/micasa/blob/main/LICENSE
EOF
}
