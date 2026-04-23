# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.117.0
pkgrel=1
pkgdesc="The Visual Studio Code Server is a service you can run on a remote development machine, like your desktop PC or a virtual machine (VM)."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://code.visualstudio.com/"
license=('custom: Microsoft EULA')
provides=('code' 'vscode')
conflicts=('code' 'vscode')
source_x86_64=(code_cli_x64_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/cli-linux-x64/stable)
source_aarch64=(code_cli_arm64_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/cli-linux-arm64/stable)
source_armv7h=(code_cli_armhf_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/cli-linux-armhf/stable)
sha256sums_x86_64=('8429d2c1e2f564739be247ca5abc20cc9e6f987b976aee04d3bb8cf350535fe1')
sha256sums_aarch64=('452dbfe3bfb901dcb4583910cd5352a63f938b212985c5f72a895a6984d72acd')
sha256sums_armv7h=('d3e9f567ea50dfd9e8651aa3b5c1d78368a65b7c68d34607119e037bbd85ae6e')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
