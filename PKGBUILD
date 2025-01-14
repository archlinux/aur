# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.96.3
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
sha256sums_x86_64=('4c427209417ca64edff3bb170dab6f572f90d825d9a80dd00a9c82b71974d572')
sha256sums_aarch64=('ac95cc20a9dddd6e198ef8ba3f808690940846acc7c802cf73b040c0950f452e')
sha256sums_armv7h=('f88c2e3b370e393dadcd6f771baf8aae2030645acf8bb4c8a2967bbe20bcdb05')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
