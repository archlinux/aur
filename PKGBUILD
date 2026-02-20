# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.109.5
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
sha256sums_x86_64=('f6a30e5b4bd0ad0b79a6a56ac69662757dca544e87479427c6663ebad33db73f')
sha256sums_aarch64=('18a0e4d31b028bb362c28a8f04deac220289ad2bf05741e5b822a465fb895d2c')
sha256sums_armv7h=('bf2923bbadacc526e1b47b265bc34cbff2c0730b1992769fd9b3b1421f5d7961')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
