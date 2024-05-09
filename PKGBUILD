# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.89.1
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
sha256sums_x86_64=('6ad10cecb1a41cce0ef3389777474b2101c3594c8e96e297dd59dc239b9faad5')
sha256sums_aarch64=('f5b41fb45d8ede5180255821ea0ee4b9ab70da87b63b288da7b35f580c09fa48')
sha256sums_armv7h=('84debd4889a79ab9139e79a542a749b3b9ebd0ebad326f40b528e60b4589b02f')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
