# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.97.0
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
sha256sums_x86_64=('60b1fadd98a1118cb4207a41177518136d0683544d2822ace1d4cc2aa664ab8a')
sha256sums_aarch64=('58e0445de8bbdb6d6e9c3c430d9ea241f223706952b8c8be3f138357f0a9ffd5')
sha256sums_armv7h=('ac087efb2bace803763e230f2b95a96714c002e9754a819197e0008dc7e99acb')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
