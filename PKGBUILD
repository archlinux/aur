# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.95.3
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
sha256sums_x86_64=('3f3bbba55287aded4e5df5d71a54b1f41889582155c5b8dd41f2eb514b1ddeaf')
sha256sums_aarch64=('1e48b0b38c0c30460b44742e832ffd660ee508a0c43b19e5514c9d30abffaef0')
sha256sums_armv7h=('fa5860b1b6791a60692565436964f0710eb91749a9692dfcc1684c0af6dc68f3')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
