# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.99.2
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
sha256sums_x86_64=('e36bc84473957a3c58ed3d7cb1c778b59cc09c197dcf9f7646d93e2dbdd97140')
sha256sums_aarch64=('c1b7da3fa1371be25be655be1577352cb7d0e3d0f2a8dd6a5cbb141a8df6b3d2')
sha256sums_armv7h=('f8f8c89091a79a1981ceb0757bb58241f2601d90fdfe8c9936c644ce1a138f82')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
