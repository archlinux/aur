# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.136.1
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
sha256sums_x86_64=('0251d430e459d81df785c2408252f87c6b4927a15fd6c551716a6d41c9ec2fe3')
sha256sums_aarch64=('4815be8f3f612d0468f492872f9a146f709fc5e5c389beeb3963641dd0cf1a9e')
sha256sums_armv7h=('bd6e24b2a00021cc4e9f991ab825fa9ae97606e0689efa88e72c22aae98203fd')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
