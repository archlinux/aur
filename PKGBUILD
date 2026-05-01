# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.118.1
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
sha256sums_x86_64=('9c9d25c9d188f9522f4dcbb4a0ad469cb2d4749bc78d76408f8f6e8dfd67573e')
sha256sums_aarch64=('4ba3d02f30d73434ba6faa378e73884db55aa089bf0d547d2506bb23365aadbe')
sha256sums_armv7h=('e0828082b9aa77cba46a2b98b1ca2ce10ed9aae10ed37524fce3b5403bd34d07')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
