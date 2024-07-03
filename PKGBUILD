# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.91.0
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
sha256sums_x86_64=('5fe069c71f1809c04924014e3a72c12c0e93c593e3b2aa86f2175d64c16161b9')
sha256sums_aarch64=('6e6d2d0c4a104a09f69a099b269ad3ec36be0c880c5b87b2f06d78777aeb81fd')
sha256sums_armv7h=('a276aadda0e15e79f438349afa02398586e5cb49c57844cca9f900a52208b14f')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
