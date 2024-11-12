# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.95.2
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
sha256sums_x86_64=('4cc66731d7c0f0aaccfcf5e0f855b99064b3d10c13e9136e6fbc9e4ce14d0811')
sha256sums_aarch64=('16ad50e0e61c47e0ac2fa26f215b0fb956ed5992bc77faa06fb45834c81647fe')
sha256sums_armv7h=('223bfb6c8a8bf151ea8a01d23badc4c52182699b2c15682e6a3369864ea236cd')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
