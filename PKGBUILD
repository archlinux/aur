# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.92.1
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
sha256sums_x86_64=('4819c4b70bb9649d3fa26ee0e6aa8aa2b6b3437ea995c6100c26a89f972cb17c')
sha256sums_aarch64=('1f3c27aeb4f6b057a5730b11c56f002dec5980ce2f8bf99fa9a743fac77b4a9b')
sha256sums_armv7h=('7bf2ad6479d587c46ee63518656b4ba0b0ad3c46bd29e355cb8fe9be942984dc')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
