# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.106.0
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
sha256sums_x86_64=('c35a07322c95d327bdd3c7818863e72901d99df0d67ad2bd486639ab726fcf87')
sha256sums_aarch64=('eb22bfb5df8fa41e4b2b6f41e0437a9fa56e82b39cb2a04fcd1e5f882d6b32e8')
sha256sums_armv7h=('ef2fe44964718eb0cf40c966f465ec227ab3c93c4f992489eb8fe402c5e5a3eb')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
