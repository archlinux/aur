# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.129.0
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
sha256sums_x86_64=('70c1034ff9374ce287029572501d9491cd2b6f5a7782e8d7b52dfc9c6034ccfd')
sha256sums_aarch64=('95c8d43c21530fbeaaa88df2f17fba95ecd4aacb2b24b7ff3859473a7446c48c')
sha256sums_armv7h=('6fe7c01be6221fce579da250b401e05a9bab5bd69950e5d8959a802feea2d126')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
