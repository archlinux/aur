# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.107.0
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
sha256sums_x86_64=('1bcd16228d71644c0564771e2884ddecd8cd81a41b58d214d7e0115a0ba023fe')
sha256sums_aarch64=('ca8448115982585ee0538edcf2a25184f692982ba46f67c7599758c17ab4f8bf')
sha256sums_armv7h=('7e5ddccdfeb1ac3cc1f4261ed09a3fe1040fc6f333afdd5372a5a42304c3fe3b')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
