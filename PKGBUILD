# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.90.0
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
sha256sums_x86_64=('a8c0e07186efa7777f2621e332f250ce5baf412078d06a575ab00eb4345ff956')
sha256sums_aarch64=('28b5e267e5cb83db66790dbc798d1c2114b67004d9c7d9d07eef38a30f784673')
sha256sums_armv7h=('67c88696dc4e0c33dc785e145169708b3f5ab8ed5eaa77e792a7abebdd3ebd5d')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
