# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=micasa-bin
pkgver=1.76.2
pkgrel=1
pkgdesc='Modal TUI for tracking home projects, maintenance schedules and vendor quotes'
arch=('x86_64' 'aarch64')
url='https://github.com/cpcloud/micasa'
license=('Apache-2.0')
provides=('micasa')
conflicts=('micasa')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/micasa_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/micasa_linux_arm64.tar.gz")
sha256sums_x86_64=('d12cc5ce57fd452e67eab11dfa922f4c212b4ac8906e76b0590710aa3cfda816')
sha256sums_aarch64=('fbfa1a9bca3dcca018e9d85dc8fda14a18563708a84821fe1ef4d4c03e911757')

package() {
    install -Dm755 micasa "${pkgdir}/usr/bin/micasa"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/cpcloud/micasa/blob/main/LICENSE
EOF
}
