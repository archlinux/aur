# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.144.0
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
sha256sums_x86_64=('da9c2abefb5f8d77fdcdce3faea7a0e920663f0d1a92287b5922ecbba3c13544')
sha256sums_aarch64=('cf5f8a1c1aa3210a530c06680f38a31901050ff4cc7e7519a4968059efb6034c')
sha256sums_armv7h=('1d8630d7b7cad6a10d8921962fa334820b9dd7d53ca9818fc48f510cea6d4e5e')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
