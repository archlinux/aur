# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=systemd-lsp-bin
pkgver=2026.01.17
pkgrel=1
pkgdesc='Language server for systemd unit files with embedded documentation'
arch=('x86_64')
url='https://github.com/JFryy/systemd-lsp'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('systemd-lsp')
conflicts=('systemd-lsp')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/systemd-lsp-x86_64-unknown-linux-gnu")
sha256sums=('8f49dc48f0c2a83abf4ca5f73e7676d625488cecb9c50d5b2620ed53d4ae0cb2')

package() {
    install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/systemd-lsp"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License - See https://github.com/JFryy/systemd-lsp/blob/main/LICENSE
EOF
}
