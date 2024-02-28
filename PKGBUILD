# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.87.0
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
sha256sums_x86_64=('82000d35eae77c55a026e62489e844ab741594d617984958b547c6cae6a1ff42')
sha256sums_aarch64=('8cd02ff78a1f11e1fec9d789a71383dd62d5b580a91311d81406166bd3f82e8a')
sha256sums_armv7h=('4407a2bfc34266e918b569777232e988caec29396c7fca081513d61462662e8f')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
