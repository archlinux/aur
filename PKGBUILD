# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=micasa-bin
pkgver=2.8.2
pkgrel=1
pkgdesc='Modal TUI for tracking home projects, maintenance schedules and vendor quotes'
arch=('x86_64' 'aarch64')
url='https://github.com/micasa-dev/micasa'
license=('Apache-2.0')
provides=('micasa')
conflicts=('micasa')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/micasa_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/micasa_linux_arm64.tar.gz")
sha256sums_x86_64=('1bc144d428096e905818ead43616007c059c0a717a1f8ddc1039c79c42d9d229')
sha256sums_aarch64=('ed35053fa6c6273cd3046ec5fab34e5f9fdd534f99449c0c01bf69922851189a')

package() {
    install -Dm755 micasa "${pkgdir}/usr/bin/micasa"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache License 2.0 - See https://github.com/micasa-dev/micasa/blob/main/LICENSE
EOF
}
