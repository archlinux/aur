# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.116.0
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
sha256sums_x86_64=('e4f0f630ff09b9b727bc350430a4068cb4b1ff63ba2ac20e67fb19cdef17d482')
sha256sums_aarch64=('e63e40b3d5dd01f6d64b34cd3ff975a774c59a7f745dbd62718147bd2810f4ec')
sha256sums_armv7h=('0480bd2b81680f2a73c2c968dc37ebfce12f4035fedeb77584be33db961ec9aa')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
