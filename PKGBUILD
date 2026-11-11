# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.146.0
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
sha256sums_x86_64=('f6240bd0d53e7e1ae7bff206221b7aa2ce28f7ffa9a9197289957b32a41368a0')
sha256sums_aarch64=('a20c90d3b048396508ba8ddd2532413e1c2e67ba2adb659d2b1cd100d0cefe3a')
sha256sums_armv7h=('2dda704df3d06d62aab63501be5f67dccdcc97e82e1d58fe8fb99e3edc1d1852')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
