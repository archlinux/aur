pkgname=dwellir-cli-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Dwellir CLI - Blockchain RPC infrastructure from your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/dwellir-public/cli"
license=('MIT')
provides=('dwellir-cli')
conflicts=('dwellir-cli')

source_x86_64=("dwellir-linux-amd64-${pkgver}.tar.gz::https://github.com/dwellir-public/cli/releases/download/v${pkgver}/dwellir_linux_amd64.tar.gz")
source_aarch64=("dwellir-linux-arm64-${pkgver}.tar.gz::https://github.com/dwellir-public/cli/releases/download/v${pkgver}/dwellir_linux_arm64.tar.gz")
sha256sums_x86_64=('28661639b7882619894d73e7d7ef6ee95b2e05f75b511e9071cf892c8379f543')
sha256sums_aarch64=('29fe92ff9ae2ddaa0d5eaa7e0865fc0c4672eb43b886e4b59b475f8393c2f877')

package() {
  install -Dm755 "${srcdir}/dwellir" "${pkgdir}/usr/bin/dwellir"
}
