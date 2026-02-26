pkgname=dwellir-cli-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Dwellir CLI - Blockchain RPC infrastructure from your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/dwellir-public/cli"
license=('MIT')
provides=('dwellir-cli')
conflicts=('dwellir-cli')

source_x86_64=("dwellir-linux-amd64-${pkgver}.tar.gz::https://github.com/dwellir-public/cli/releases/download/v${pkgver}/dwellir_linux_amd64.tar.gz")
source_aarch64=("dwellir-linux-arm64-${pkgver}.tar.gz::https://github.com/dwellir-public/cli/releases/download/v${pkgver}/dwellir_linux_arm64.tar.gz")
sha256sums_x86_64=('8519497217cec093366c45a512adf716b6c357ff108d6b0a700db9f773bd9d7f')
sha256sums_aarch64=('cbec9359f4c02c434453b244e73033c076533eaa5f19e1638953ae51acd58494')

package() {
  install -Dm755 "${srcdir}/dwellir" "${pkgdir}/usr/bin/dwellir"
}
