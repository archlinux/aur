# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.147.0
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
sha256sums_x86_64=('83097e214bc14cffb7f2d31b5835bd44233ab8a86d4ce3cdd83659913ecd340e')
sha256sums_aarch64=('005adde4818cf41971f93912c401a2a82633886d4eaa9cd12ae842cf9341130d')
sha256sums_armv7h=('8a0c9875175e0cf47ddc01f4474f42245e750b97fd035b554e4ecf61a7aa3f09')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
