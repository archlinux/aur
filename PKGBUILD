# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.141.0
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
sha256sums_x86_64=('3c10d8ad7b5d6dac8ba0dab9b6153d30942cd6f19b6549c07e039e884a9c625f')
sha256sums_aarch64=('ce4f9d2fe308ae39dd98d3eb48085865cc3ad192cc7064166ba776601cddd317')
sha256sums_armv7h=('77cd73dc577e16f0608ed1c86da8ac4954000fb37748e4591ead71747d7b90cd')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
