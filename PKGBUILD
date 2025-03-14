# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.98.2
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
sha256sums_x86_64=('ab2dea96fda73e399f448235fc360dfc4d76442734ce8d86e20e39de30d3a898')
sha256sums_aarch64=('064a00f5726d8c46ac9dce8a1d4c75d749915ea8977b201618937c48d59684d6')
sha256sums_armv7h=('b7e3d7b6e91921d8405e888e59f0d288625f4f1fe8971908c6bc3a2ec8cdcd3a')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
