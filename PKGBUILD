# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.142.0
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
sha256sums_x86_64=('266971dc63df73374f757a071fecd31f24aa1426ba305688d78ccb0c687ba45c')
sha256sums_aarch64=('e2f04ad9496c5687e6f5cdffab6b82bb23d077143e01f93b7bb0bc3e7bb055c4')
sha256sums_armv7h=('a0b8ee6e2d98c77010d3685ac837b61f7ccc537986738a73037a37217d0c85d2')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
