# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.93.0
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
sha256sums_x86_64=('6da9b3b3d3e8010913b7363b8167ea8ca1fbfed1bf6895822274e7297b479e6d')
sha256sums_aarch64=('379d88869c6c54520a9626c589114bf6d790cdbf93e297dca460afa677bbf5e0')
sha256sums_armv7h=('42f56d0e0286bb924dc0b96787eecf0bd6275b1f0d3e5ac5d9b1156a020e8f13')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
