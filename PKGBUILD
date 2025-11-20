# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.106.2
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
sha256sums_x86_64=('fc79eee4631ef260f7a184aab3601a7b9df9e47b20ab15c7b71ac5b49e917194')
sha256sums_aarch64=('4c2f01627dfb4134e4d45c45a73b99ed83fc407c718f5adf7b8548aac401a876')
sha256sums_armv7h=('f86034cbcb822044ddbcceb430b2aa3435f88db3f67dea770be5edc42c1ac2ed')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
