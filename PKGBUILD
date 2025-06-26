# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.101.2
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
sha256sums_x86_64=('dccd95b53c834b7c57d2f2f8e40a319fa287a8da3549a53dbb7b3eca7b8809f2')
sha256sums_aarch64=('2a7db25cc142377e4d316d071a79348b3a98c5ab3b35af02a4ee77802b86b77d')
sha256sums_armv7h=('bfae915af025d945d097f2af1c6db954d294dda08c4b2fc194b9ad312b3a6ce9')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
