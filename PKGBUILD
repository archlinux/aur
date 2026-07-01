# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.127.0
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
sha256sums_x86_64=('6f076b0ddecb89bbdefc8baeed0fcd0b1d81029976ad26fba2623c58200510c0')
sha256sums_aarch64=('4c8801466cb4af6b85db2b1e68b63c8f262a27fb436702f08d0f1a984b0619df')
sha256sums_armv7h=('d12373e883877389df2c74b344ea968fef4b548a5fde51d11ba1b8e3bb48c8fb')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
