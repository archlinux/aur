# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.101.1
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
sha256sums_x86_64=('d09917ede4e84851b03d6cdc0de15557d8f8aff5a3a6697144a2909f7a041d3e')
sha256sums_aarch64=('18add558c5a4901b547a8154196cc8bd2acfed03382598c1e82319facc63ccb4')
sha256sums_armv7h=('30df43eb70cfe6d0e667e68e64c172388a54ecbe568eb3c77551b7f647174c70')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
