# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.140.0
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
sha256sums_x86_64=('51ca3c8878a73d8c4e3c8664fd0fd630d113a0392d980437d88fcb86b640c729')
sha256sums_aarch64=('7dad8f4b6c13df0f82c9cf34516dbded8d7d25f8bea3de7b8b36f58ccf476914')
sha256sums_armv7h=('117266cc47da239d13c52943a0b96f3ab8c171b20272908c7e57aecb80555fdd')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
