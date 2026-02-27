pkgname=dwellir-cli-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="Dwellir CLI - Blockchain RPC infrastructure from your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/dwellir-public/cli"
license=('MIT')
provides=('dwellir-cli')
conflicts=('dwellir-cli')

source_x86_64=("dwellir-linux-amd64-${pkgver}.tar.gz::https://github.com/dwellir-public/cli/releases/download/v${pkgver}/dwellir_linux_amd64.tar.gz")
source_aarch64=("dwellir-linux-arm64-${pkgver}.tar.gz::https://github.com/dwellir-public/cli/releases/download/v${pkgver}/dwellir_linux_arm64.tar.gz")
sha256sums_x86_64=('c20efa52701b8cb4e3ba7233a04d71b02b8054907283e71052462062841af5a3')
sha256sums_aarch64=('c6eb26e8039cf8c0c47c90d4815443c04dfc76f42280d6a3ccff47a32e54afa5')

package() {
  install -Dm755 "${srcdir}/dwellir" "${pkgdir}/usr/bin/dwellir"
}
