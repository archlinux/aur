# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=micasa-bin
pkgver=2.8.1
pkgrel=1
pkgdesc='Modal TUI for tracking home projects, maintenance schedules and vendor quotes'
arch=('x86_64' 'aarch64')
url='https://github.com/micasa-dev/micasa'
license=('Apache-2.0')
provides=('micasa')
conflicts=('micasa')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/micasa_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/micasa_linux_arm64.tar.gz")
sha256sums_x86_64=('a915b4562f312cd6e5b413beaed467daaf4b641dd87de33fff4f644346e0cc1c')
sha256sums_aarch64=('c92b12ec4948729e7abacfe3c6899572860afe593415d3bd20382cf4ff9f6347')

package() {
    install -Dm755 micasa "${pkgdir}/usr/bin/micasa"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/micasa-dev/micasa/blob/main/LICENSE
EOF
}
