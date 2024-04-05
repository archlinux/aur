# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.88.0
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
sha256sums_x86_64=('27ac4a6928534f94ac0b07fe3376ef06c9be5b18617d0d3c0486eafb05e17973')
sha256sums_aarch64=('281bf2be6fc31d14f06cb637439ce92972d0b00091803c90f3a30b9fa6f811dd')
sha256sums_armv7h=('c008679e68483f8136ca2c9b899de8f74501dcdd6010ad2fa874e6e47aec6fff')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
