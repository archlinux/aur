# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=micasa-bin
pkgver=2.6.0
pkgrel=1
pkgdesc='Modal TUI for tracking home projects, maintenance schedules and vendor quotes'
arch=('x86_64' 'aarch64')
url='https://github.com/micasa-dev/micasa'
license=('Apache-2.0')
provides=('micasa')
conflicts=('micasa')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/micasa_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/micasa_linux_arm64.tar.gz")
sha256sums_x86_64=('8494882736aac731eadfd17f00b87fa6f0cf51ceb50189e7742915ca52150617')
sha256sums_aarch64=('4675b4e985f2dc5a548b6c9b3f2979126f43468e4388dbfc743872ac9fb0de60')

package() {
    install -Dm755 micasa "${pkgdir}/usr/bin/micasa"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/micasa-dev/micasa/blob/main/LICENSE
EOF
}
