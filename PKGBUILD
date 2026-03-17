pkgname=dwellir-cli-bin
pkgver=0.1.23
pkgrel=1
pkgdesc="Dwellir CLI - Blockchain RPC infrastructure from your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/dwellir-public/cli"
license=('MIT')
provides=('dwellir-cli')
conflicts=('dwellir-cli')

source_x86_64=("dwellir-linux-amd64-${pkgver}.tar.gz::https://github.com/dwellir-public/cli/releases/download/v${pkgver}/dwellir_linux_amd64.tar.gz")
source_aarch64=("dwellir-linux-arm64-${pkgver}.tar.gz::https://github.com/dwellir-public/cli/releases/download/v${pkgver}/dwellir_linux_arm64.tar.gz")
sha256sums_x86_64=('22f237fdca3e08c721aa1521d676ef03f09020a6674b1b7b229a2f686bee2b74')
sha256sums_aarch64=('529abf44033975f2e2d8969ecdd72316828d3428fc924d2b82cff9705c24736b')

package() {
  install -Dm755 "${srcdir}/dwellir" "${pkgdir}/usr/bin/dwellir"
}
