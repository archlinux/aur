# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.112.0
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
sha256sums_x86_64=('d8f7ef1882fe99b382469ffa1821a3eaff944ad6f3df5ef6149236d4c4d6f1cc')
sha256sums_aarch64=('3668124d489c93552bf3bf13ab9b93c29eeedc5ee8f9b3ac7f2f5b8bbfa079c0')
sha256sums_armv7h=('aef6a4523e4409f50918b81736ea0b495d9759d5f8c6493011576352601ec630')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
