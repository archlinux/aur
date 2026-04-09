pkgname=dwellir-cli-bin
pkgver=0.1.26
pkgrel=1
pkgdesc="Dwellir CLI - Blockchain RPC infrastructure from your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/dwellir-public/cli"
license=('MIT')
provides=('dwellir-cli')
conflicts=('dwellir-cli')

source_x86_64=("dwellir-linux-amd64-${pkgver}.tar.gz::https://github.com/dwellir-public/cli/releases/download/v${pkgver}/dwellir_linux_amd64.tar.gz")
source_aarch64=("dwellir-linux-arm64-${pkgver}.tar.gz::https://github.com/dwellir-public/cli/releases/download/v${pkgver}/dwellir_linux_arm64.tar.gz")
sha256sums_x86_64=('1c25d7b8bdc2ae16e108f712f5a48f9c5a310f1912d59baac83dad0f8716599e')
sha256sums_aarch64=('63704f6bb2874305fe5b8524330d0eb1e3607295311c53ce4d5b8dfcf2a4de29')

package() {
  install -Dm755 "${srcdir}/dwellir" "${pkgdir}/usr/bin/dwellir"
}
