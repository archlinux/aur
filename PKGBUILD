# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.126.0
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
sha256sums_x86_64=('d4fdd7626fddd9c3985f1ba618721e5874c3e3915c8d73951a070d953c0e3270')
sha256sums_aarch64=('a3a0ebcac55dda07e3799bc1a200ea83c118afbaf82e598014a21abaac8df2f2')
sha256sums_armv7h=('91a6b1e859b6e1f7b27da6802239cb1ead58d8a3dea97cbb3ad89176375ee478')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
