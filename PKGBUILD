# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.148.0
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
sha256sums_x86_64=('a3ea5f932f6b4b20e880649e2cdce21eb6025278a95afe8e6cee5ca70a2eba51')
sha256sums_aarch64=('6a30aefb0a7a74588d2367e6e3733144deddb62aeb2105c8979b21d6524ce785')
sha256sums_armv7h=('7e4d2e0d5840fbf578136f8772944b283312283e9fee82be81814ff36992e66c')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
