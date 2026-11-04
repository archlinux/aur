# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.145.0
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
sha256sums_x86_64=('d7656edc8448f7ef64e5fab4ae2acc0a1c47c0f33fbca7fcdf3283f89c079161')
sha256sums_aarch64=('c3b84f2c0275a188d7bf3910a738b4d32c021245f0cb5704addf8f314a433e78')
sha256sums_armv7h=('2c52f0e62d8fcd5c8085b66f45760571b9916374a2e97cbe0154d84e309ae311')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
