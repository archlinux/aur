# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.110.1
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
sha256sums_x86_64=('7aac9a048e09be6f29cbb8154fa2b3f6351a603e1551b3301c1b33a65eb83b8d')
sha256sums_aarch64=('c8ef803f687d5f15357d98508c101f8b9fbe5f3d6fe4e4c0975605efed5a8a86')
sha256sums_armv7h=('bb3106e44b208010fd5e3cfc9213ab70ba46dfb55dc4fd764b1bc6f56ca23f6a')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
